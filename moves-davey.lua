if not charSelectExists then return end

local function davey_gravity(m)
    init_locals(m)

    if jumpAct[m.action] and e.actionTick == 0 then
        m.vel.y = m.vel.y + 20
    end
end

ACT_DAVEY_SPIN = allocate_mario_action(ACT_FLAG_MOVING)
ACT_DAVEY_SPIN_JUMP = allocate_mario_action(ACT_FLAG_MOVING | ACT_FLAG_AIR)
ACT_DAVEY_DRILL_DOWN = allocate_mario_action(ACT_FLAG_MOVING | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
ACT_DAVEY_HAMMER_SWING = allocate_mario_action(ACT_FLAG_MOVING | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_ATTACKING)
ACT_DAVEY_ITEM_THROW = allocate_mario_action(ACT_FLAG_STATIONARY | ACT_GROUP_STATIONARY)

function act_davey_spin(m)
    init_locals(m)

    if m.actionTimer == 0 then
        set_mario_animation(m, CHAR_ANIM_TWIRL)
    end

    mario_set_forward_vel(m, approach_f32(m.forwardVel, 0, 0.7, 0.7))
    set_turn_speed(0x800)
    spawn_particle(m, PARTICLE_DUST)

    local step = perform_ground_step(m)
    if step == GROUND_STEP_LEFT_GROUND then return set_mario_action(m, ACT_FREEFALL, 0) end
    if e.spinTimer == 0 then set_mario_action(m, ACT_WALKING, 0) end

    if buttonApress then
        return set_mario_action(m, ACT_DAVEY_SPIN_JUMP, 0)
    end

    e.gfxAngleY = e.gfxAngleY + 0x2800
    m.marioObj.header.gfx.angle.y = e.gfxAngleY

    m.actionTimer = m.actionTimer + 1
    return false
end

function act_davey_spin_jump(m)
    init_locals(m)
    if m.actionTimer == 0 then
        play_character_sound(m, CHAR_SOUND_YAHOO)
    end

    if buttonZdown then
        set_mario_action(m, ACT_DAVEY_DRILL_DOWN, 0)
    end

    if buttonBpress then
        set_mario_action(m, ACT_DIVE, 0)
    end

    --[[
    if m.vel.y < 0 then
        if buttonAdown then
            m.vel.y = -10
        else 
            m.vel.y = m.vel.y + 0.9
        end
    end
    ]]

    common_air_action_step(m, ACT_FREEFALL_LAND, CHAR_ANIM_TWIRL, AIR_STEP_NONE)

    

    e.gfxAngleY = e.gfxAngleY + 0x4500
    m.marioObj.header.gfx.angle.y = e.gfxAngleY

    m.actionTimer = m.actionTimer + 1
    return false
end

function act_davey_drill_down(m)
    init_locals(m)
    if e.actionTick == 0 then
        spawn_particle(m, PARTICLE_MIST_CIRCLE)
    end
    
    mario_set_forward_vel(m, 0)

    if m.vel.y < 0 then
        spawn_particle(m, PARTICLE_DUST)
    end

    local air = perform_air_step(m, 0)

    if air == AIR_STEP_LANDED then
        set_mario_action(m, ACT_GROUND_POUND_LAND, 0)
        spawn_particle(m, PARTICLE_MIST_CIRCLE)
        spawn_particle(m, PARTICLE_HORIZONTAL_STAR)
        play_mario_heavy_landing_sound(m, SOUND_ACTION_TERRAIN_HEAVY_LANDING)
    end

    m.vel.y = -74

    e.gfxAngleY = e.gfxAngleY + 0x4000
    m.marioObj.header.gfx.angle.y = e.gfxAngleY
    

    if e.actionTick % 10 == 0 then
        play_sound(SOUND_ACTION_SPIN, m.marioObj.header.gfx.cameraToObject)
    end

    m.actionTimer = m.actionTimer + 1
    return false
end

function act_davey_item(m)
    init_locals(m)

    if m.actionTimer == 0 then
        set_mario_animation(m, CHAR_ANIM_THROW_LIGHT_OBJECT)
    end

    local step = perform_ground_step(m)

    if m.actionTimer > 10 then
        set_mario_action(m, ACT_IDLE, 0)
    end

    m.actionTimer = m.actionTimer + 1
    
end

---
--- comment
--- @param m MarioState
function act_davey_hammer_swing(m)
    init_locals(m)
    if m.actionTimer == 0 then
        set_character_animation(m, CHAR_ANIM_BREAKDANCE)
        smlua_anim_util_set_animation(m.marioObj, 'DT_HAMMER')
    end

    m.marioBodyState.handState = MARIO_HAND_PEACE_SIGN

    local step = perform_ground_step(m)

    if m.actionTimer == 8 then
        play_character_sound(m, CHAR_SOUND_YAHOO)
        spawn_particle(m, PARTICLE_MIST_CIRCLE)
        spawn_particle(m, PARTICLE_HORIZONTAL_STAR)
        play_sound(SOUND_ACTION_METAL_HEAVY_LANDING, m.marioObj.header.gfx.cameraToObject)
        m.flags = m.flags | MARIO_PUNCHING
    end
    if m.actionTimer == 13 then return set_mario_action(m, ACT_IDLE, 0) end

    m.actionTimer = m.actionTimer + 1
end

hook_mario_action(ACT_DAVEY_ITEM_THROW, {every_frame = act_davey_item})
hook_mario_action(ACT_DAVEY_SPIN_JUMP, {every_frame = act_davey_spin_jump})
hook_mario_action(ACT_DAVEY_SPIN, {every_frame = act_davey_spin})
hook_mario_action(ACT_DAVEY_DRILL_DOWN, {every_frame = act_davey_drill_down})
hook_mario_action(ACT_DAVEY_HAMMER_SWING, {every_frame = act_davey_hammer_swing})

function before_update_dt(m)
    init_locals(m)

    if m.action == ACT_DAVEY_SPIN then
        mario_set_forward_vel(m, e.lastSpeed)
    end
end

function on_set_action_dt(m)
    init_locals(m)

    if m.action == ACT_DAVEY_SPIN_JUMP then
        m.vel.y = 80
    end
end

---comment
---@param m MarioState
function update_dt_chars(m)
    init_locals(m)

    e.actionTick = e.actionTick + 1
    if e.prevFrameAction ~= m.action then
        e.prevFrameAction = m.action
        e.actionTick = 0
    end

    e.lastSpeed = get_current_speed(m)
    determine_stick_spin(c)
    check_spin(c)

    m.peakHeight = m.pos.y

    if jumpAct[action] and m.action ~= ACT_LONG_JUMP then
        davey_gravity(m)
    end

    if is_grounded(m) then
        if not excludeGroundAttackAct[action] then
            if check_spin(c) then
                set_mario_action(m, ACT_DAVEY_SPIN, 0)
            end
        end
    end

    if action == ACT_CROUCHING or action == ACT_CROUCH_SLIDE or action == ACT_START_CROUCHING or action == ACT_START_CRAWLING or action == ACT_CRAWLING then
        if buttonXpress then
            set_mario_action(m, ACT_DAVEY_ITEM_THROW, 0)
        end
        if buttonYpress then
            set_mario_action(m, ACT_DAVEY_HAMMER_SWING, 0)
        end
    end

    -- waterbreathing and immunity to squishing
    if m.waterLevel > m.pos.y or action == ACT_SQUISHED then
        m.health = m.health + 100
    end
end

charSelect.character_hook_moveset(CHAR_DAVEY_TOOIE, HOOK_BEFORE_MARIO_UPDATE, before_update_dt)
charSelect.character_hook_moveset(CHAR_DAVEY_TOOIE, HOOK_MARIO_UPDATE, update_dt_chars)
charSelect.character_hook_moveset(CHAR_DAVEY_TOOIE, HOOK_ON_SET_MARIO_ACTION, on_set_action_dt)