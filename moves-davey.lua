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

    mario_set_forward_vel(m, approach_f32(m.forwardVel, 0, 3, 3))
    set_turn_speed(0x800)
    spawn_particle(m, PARTICLE_DUST)

    local step = perform_ground_step(m)
    if step == GROUND_STEP_LEFT_GROUND then return set_mario_action(m, ACT_FREEFALL, 0) end
    if e.actionTick > 30 and not buttonYdown then set_mario_action(m, ACT_IDLE, 0) end

    if buttonApress then
        m.vel.y = m.vel.y + 74
        set_mario_action(m, ACT_DAVEY_SPIN_JUMP, 0)
    end

    e.gfxAngleY = e.gfxAngleY + 0x2800
    m.marioObj.header.gfx.angle.y = e.gfxAngleY

    m.actionTimer = m.actionTimer + 1
    return false
end

function act_davey_spin_jump(m)
    init_locals(m)
    
    common_air_action_step(m, ACT_FREEFALL_LAND, CHAR_ANIM_TWIRL, AIR_STEP_NONE)
    if m.vel.y < 0 then
        if buttonAdown then
            m.vel.y = -10
        else 
            m.vel.y = m.vel.y + 0.9
        end
    end

    set_turn_speed(0x800)

    if buttonZdown then
        set_mario_action(m, ACT_DAVEY_DRILL_DOWN, 0)
    end

    e.gfxAngleY = e.gfxAngleY + 0x3000
    m.marioObj.header.gfx.angle.y = e.gfxAngleY

    m.actionTimer = m.actionTimer + 1
    return false
end

function act_davey_drill_down(m)
    init_locals(m)

    if e.actionTick == 0 then

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

    m.actionTimer = m.actionTimer + 1
    return false
end

function act_davey_item(m)
    init_locals(m)

    if m.actionTimer == 0 then
        set_mario_animation(m, CHAR_ANIM_THROW_LIGHT_OBJECT)
    end

    local step = perform_ground_step(m)

    if e.actionTick > 10 then
        set_mario_action(m, ACT_IDLE, 0)
    end

    m.actionTimer = m.actionTimer + 1
end

hook_mario_action(ACT_DAVEY_ITEM_THROW, {every_frame = act_davey_item})
hook_mario_action(ACT_DAVEY_SPIN_JUMP, {every_frame = act_davey_spin_jump})
hook_mario_action(ACT_DAVEY_SPIN, {every_frame = act_davey_spin})
hook_mario_action(ACT_DAVEY_DRILL_DOWN, {every_frame = act_davey_drill_down})

function update_dt_chars(m)
    init_locals(m)
    global_action_tick(m)

    m.peakHeight = m.pos.y

    if jumpAct[action] and m.action ~= ACT_LONG_JUMP then
        davey_gravity(m)
    end

    if is_grounded(m) and e.actionTick > 5 then
        if buttonYpress then
            set_mario_action(m, ACT_DAVEY_SPIN, 0)
        end
    end

    if action == ACT_CROUCHING and buttonXpress then
        set_mario_action(m, ACT_DAVEY_ITEM_THROW, 0)
    end
end

charSelect.character_hook_moveset(CHAR_DAVEY_TOOIE, HOOK_MARIO_UPDATE, update_dt_chars)