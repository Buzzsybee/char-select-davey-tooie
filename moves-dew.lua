if not charSelectExists then return end

local function dew_gravity(m)
    init_locals(m)

    if jumpAct[m.action] and e.actionTick == 0 then
        m.vel.y = m.vel.y + 10
    end
end

-- will try this custom object from wapeach extrachars (im truly learning new styff heres)
---@param o Object
local function bhv_fire_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE | OBJ_FLAG_SET_FACE_ANGLE_TO_MOVE_ANGLE

    o.oDamageOrCoinValue = 4
    o.oNumLootCoins = 0
    o.oHealth = 0
    o.hitboxRadius = 100
    o.hitboxHeight = 80
    o.hurtboxRadius = 60
    o.hurtboxHeight = 80
    o.hitboxDownOffset = 0
    o.oInteractType = 0

    cur_obj_scale(4)
    cur_obj_become_tangible()

    network_init_object(o, true, {})
end

---@param o Object
local function bhv_fire_loop(o)
    local m = gMarioStates[network_local_index_from_global(o.globalPlayerIndex)]
    local v = {
        x = m.pos.x + sins(m.faceAngle.y) * 130,
        y = m.pos.y,
        z = m.pos.z + coss(m.faceAngle.y) * 130
    }

    obj_set_billboard(o)
    obj_process_attacks(o, bhvAttacks)
    o.oVelX =  o.oPosX + v.x
    o.oVelZ = o.oPosZ + v.z

    if o.oTimer == 60 then
        obj_mark_for_deletion(o)
    end
end

local id_bhvFireDew = hook_behavior(nil, OBJ_LIST_DESTRUCTIVE, true, bhv_fire_init, bhv_fire_loop, "bhvDaveyHammer")

function dew_staff_pound(m)
    local v = {
        x = m.pos.x + sins(m.faceAngle.y) * 130,
        y = m.pos.y,
        z = m.pos.z + coss(m.faceAngle.y) * 130
    }
    spawn_non_sync_object(id_bhvSparkleParticleSpawner, E_MODEL_NONE, v.x, v.y, v.z, nil)
    spawn_non_sync_object(id_bhvVertStarParticleSpawner, E_MODEL_NONE, v.x, v.y, v.z, nil)
    if m.playerIndex == 0 then
        spawn_sync_object(id_bhvFireDew, E_MODEL_RED_FLAME, v.x, v.y + 30, v.z, function(o)
            o.globalPlayerIndex = m.marioObj.globalPlayerIndex
        end)
    end
end

ACT_DEW_STAFF_SWING = allocate_mario_action(allocate_mario_action(ACT_FLAG_MOVING | ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_ATTACKING))

function act_dew_staff_swing(m)
    init_locals(m)
    if m.actionTimer == 0 then
        set_character_animation(m, CHAR_ANIM_BREAKDANCE)
        smlua_anim_util_set_animation(m.marioObj, 'DT_HAMMER')
        play_character_sound(m, CHAR_SOUND_HRMM)
    end

    mario_set_forward_vel(m, approach_f32(e.lastSpeed, 0, 1, 1))
    m.marioBodyState.handState = MARIO_HAND_PEACE_SIGN

    local step = perform_ground_step(m)

    if m.actionTimer == 19 then
        play_character_sound(m, CHAR_SOUND_GROUND_POUND_WAH)
        dew_staff_pound(m)
        m.flags = m.flags | MARIO_KICKING
    end
    if m.actionTimer == 30 then return set_mario_action(m, ACT_IDLE, 0) end

    m.actionTimer = m.actionTimer + 1
end

hook_mario_action(ACT_DEW_STAFF_SWING, act_dew_staff_swing)

function on_set_action_dew(m)
    init_locals(m)

    if m.action == ACT_DAVEY_SPIN_JUMP then
        m.vel.y = 80
    end

    if (action == ACT_PUNCHING or action == ACT_MOVE_PUNCHING) and m.prevAction ~= ACT_DEW_STAFF_SWING then
        set_mario_action(m, ACT_DEW_STAFF_SWING, 0)
    end
end

local function before_update_dew(m)
    init_locals(m)

    if m.action == ACT_DAVEY_SPIN then
        mario_set_forward_vel(m, e.lastSpeed)
    end

    local anim = animsDew[m.marioObj.header.gfx.animInfo.animID]
    if anim then
        smlua_anim_util_set_animation(m.marioObj, anim)

        if m.action == ACT_IDLE then
            m.actionTimer = m.actionTimer + 1
            if m.actionTimer > 900 then
                m.actionState = 3
            else
                m.actionState = 0
            end
        end
    end
end

---comment
---@param m MarioState
function update_dew(m)
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
        dew_gravity(m)
    end

    if is_grounded(m) then
        if not excludeGroundAttackAct[action] then
            if check_spin(c) then
                set_mario_action(m, ACT_DAVEY_SPIN, 0)
            end
        end
    end

    if action == ACT_DEW_STAFF_SWING and m.actionTimer > 2 then
        if buttonBpress and m.actionTimer < 15 then
            return set_mario_action(m, ACT_PUNCHING, 0)
        end
    end

    if m.marioBodyState.capState == 1 and action ~= ACT_SLEEPING then m.marioBodyState.eyeState = MARIO_EYES_LOOK_UP end
end

charSelect.character_hook_moveset(CHAR_DEW, HOOK_BEFORE_MARIO_UPDATE, before_update_dew)
charSelect.character_hook_moveset(CHAR_DEW, HOOK_MARIO_UPDATE, update_dew)
charSelect.character_hook_moveset(CHAR_DEW, HOOK_ON_SET_MARIO_ACTION, on_set_action_dew)