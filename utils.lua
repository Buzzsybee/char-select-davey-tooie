-- just general utility functions that are handy when i make me codees
-- usually just changing the state table name is enough to use this as a template for other movesets,, is this good practice X3?

gDaveyStates = {}
function reset_davey_states(index)
    if index == nil then index = 0 end
    gDaveyStates[index] = {
        index = network_global_index_from_local(0),
        actionTick = 0,
        prevFrameAction = 0,

        lastSpeed = 0,

        gfxAngleX = 0,
        gfxAngleY = 0,
        gfxAngleZ = 0,
    }
end

for i = 0, (MAX_PLAYERS - 1) do
    reset_davey_states(i)
end

c = gMarioStates[0] -- just in case m doesnt exist,,

-- using this to normalize air actions to only be doable in this acts
jumpActs = {
    ACT_JUMP,
    ACT_DOUBLE_JUMP,
    ACT_TRIPLE_JUMP,
    ACT_BACKFLIP,
    ACT_SIDE_FLIP,
    ACT_LONG_JUMP,
    ACT_WALL_KICK_AIR,
    ACT_JUMP_KICK,
    ACT_FREEFALL,
    ACT_WATER_JUMP,
    ACT_DIVE,
    ACT_STEEP_JUMP,
    ACT_FORWARD_ROLLOUT,
    ACT_BACKWARD_ROLLOUT,
    ACT_TOP_OF_POLE_JUMP,
    ACT_GROUND_POUND,
    ACT_SPAWN_SPIN_AIRBORNE,
    ACT_SPAWN_NO_SPIN_AIRBORNE,
}
jumpAct = {}
for _, v in ipairs(jumpActs) do
    jumpAct[v] = true
end

-- prevents sequence breaks,,
excludeGroundAttackActs = {
    ACT_GROUND_BONK,
    ACT_BACKWARD_GROUND_KB,
    ACT_FORWARD_GROUND_KB,
    ACT_SOFT_BACKWARD_GROUND_KB,
    ACT_SOFT_FORWARD_GROUND_KB,
    ACT_STAR_DANCE_EXIT,
    ACT_STAR_DANCE_NO_EXIT,
    ACT_CREDITS_CUTSCENE,
    ACT_BUTT_STUCK_IN_GROUND,
    ACT_HOLD_BEGIN_SLIDING,
    ACT_HOLD_HEAVY_IDLE,
    ACT_UNLOCKING_STAR_DOOR,
    ACT_READING_SIGN,
    ACT_READING_NPC_DIALOG,
    ACT_PULLING_DOOR,
    ACT_PUTTING_ON_CAP,
    ACT_PUSHING_DOOR,
    ACT_HOLDING_BOWSER,
    ACT_HOLD_HEAVY_WALKING,
    ACT_HOLD_IDLE,
    ACT_HOLD_STOMACH_SLIDE,
    ACT_HOLD_WALKING,
    ACT_DIVE_SLIDE,
    ACT_DIVE_PICKING_UP,
    ACT_BUTT_SLIDE,
    ACT_STOMACH_SLIDE,
    ACT_UNLOCKING_KEY_DOOR,
    ACT_RIDING_SHELL_GROUND,
    ACT_READING_AUTOMATIC_DIALOG,
    ACT_EXIT_LAND_SAVE_DIALOG,
    ACT_DEATH_EXIT,
    ACT_DEATH_EXIT_LAND,
    ACT_DISAPPEARED,
    ACT_TELEPORT_FADE_IN,
    ACT_TELEPORT_FADE_OUT,
    ACT_ENTERING_STAR_DOOR,
    ACT_HARD_BACKWARD_GROUND_KB,
    ACT_HARD_FORWARD_GROUND_KB,
    ACT_SPECIAL_DEATH_EXIT,
    ACT_WARP_DOOR_SPAWN,
}

excludeGroundAttackAct = {}
for _, v in ipairs(excludeGroundAttackActs) do
    excludeGroundAttackAct[v] = true
end

function convert_s16(num)
    local min = -32768
    local max = 32767
    while (num < min) do
        num = max + (num - min)
    end
    while (num > max) do
        num = min + (num - max)
    end
    return num
end

-- iunno if this is the same as convert_s16... :<
function s16(x)
    x = (math.floor(x) & 0xFFFF)
    if x >= 32768 then return x - 65536 end
    return x
end

function spawn_particle(m, particle)
    m.particleFlags = m.particleFlags | particle
end

-- controller button variables for simplicity :3
function init_buttons()
    buttonP = c.controller.buttonPressed
    buttonD = c.controller.buttonDown

    buttonApress = c.controller.buttonPressed & A_BUTTON ~= 0
    buttonBpress = c.controller.buttonPressed & B_BUTTON ~= 0
    buttonXpress = c.controller.buttonPressed & X_BUTTON ~= 0
    buttonYpress = c.controller.buttonPressed & Y_BUTTON ~= 0
    buttonZpress = c.controller.buttonPressed & Z_TRIG ~= 0
    buttonAdown = c.controller.buttonDown & A_BUTTON ~= 0
    buttonBdown = c.controller.buttonDown & B_BUTTON ~= 0
    buttonXdown = c.controller.buttonDown & X_BUTTON ~= 0
    buttonYdown = c.controller.buttonDown & Y_BUTTON ~= 0
    buttonZdown = c.controller.buttonDown & Z_TRIG ~= 0
end

-- using this to simplify an action midair that should let you ground pound or any other stuff
function make_actionable_air(m)
    if e.actionTick > 0 then
        if buttonZpress then
            set_mario_action(m, ACT_GROUND_POUND, 0)
        end
    end
end

function is_grounded(m)
    if m.floorHeight == m.pos.y then
        return true
    end
    return false
end

function get_current_speed(m)
    return math.sqrt((m.vel.x * m.vel.x) + (m.vel.z * m.vel.z))
end

function set_turn_speed(speed)
    c.faceAngle.y = c.intendedYaw - approach_s32(intendedYawbutcoolig, 0, speed, speed)
end

function init_locals(m)
    init_buttons()
    e = gDaveyStates[m.playerIndex]
    mag = m.controller.stickMag / 64
    intendedYawbutcoolig = s16(m.intendedYaw - m.faceAngle.y)
    action = c.action 
end

function global_action_tick(m)
    local e = gDaveyStates[m.playerIndex]
    e.actionTick = e.actionTick + 1
    if e.prevFrameAction ~= m.action then
        e.prevFrameAction = m.action
        e.actionTick = 0
    end
end

---@param c MarioState
function determine_stick_spin(c)
    local oldAngle = 0
    local stickRot = math.atan(c.controller.stickX, c.controller.stickY)
    if stickRot - oldAngle > 360 then
        return true
    end
    oldAngle = stickRot
    return false
end