-- name: [CS] Davey Tooie
-- description:

local TEXT_MOD_NAME = "[CS] Davey Tooie"

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

local E_MODEL_DAVEYT = smlua_model_util_get_id("daveyt_geo")
local E_MODEL_DEW = smlua_model_util_get_id("dew_geo")
local TEX_ICON_DAVEYT = get_texture_info("daveyt_icon")
local TEX_ICON_DEW = get_texture_info("dew_icon")
local DAVEYT_GRAFFITI = get_texture_info("daveytoo_graffiti")
--local DEW_GRAFFITI = get_texture_info("dew_graffiti")

local PALETTE_DAVEYT = {
    [PANTS]  = "515558",
    [SHIRT]  = "91B3D2",
    [GLOVES] = "FFFFFF",
    [SHOES]  = "8DB8EE",
    [HAIR]   = "7D664A",
    [SKIN]   = "FFE1C2",
    [CAP]    = "FFCE01",
	[EMBLEM] = "8B32A2"
}

_G.charSelect.character_add_palette_preset(E_MODEL_DAVEYT, PALETTE_DAVEYT)
charSelect.character_add_palette_preset(E_MODEL_DEW, PALETTE_DAVEYT)

local CAPS_DT = {
    normal = smlua_model_util_get_id("normal_dt_geo"),
    wing = smlua_model_util_get_id("wing_cap_dt_geo"),
    metal = smlua_model_util_get_id("metal_cap_dt_geo"),
    metalWing = smlua_model_util_get_id("metalwing_cap_dt_geo"),
}

local CAPS_DEW = {
    normal = smlua_model_util_get_id("normal_dew_geo"),
    wing = smlua_model_util_get_id("wing_cap_dew_geo"),
    metal = smlua_model_util_get_id("metal_cap_dew_geo"),
    metalWing = smlua_model_util_get_id("metalwing_cap_dew_geo"),
}

local animsDT = {
    [CHAR_ANIM_RUNNING] = 'DT_RUN',
    --IDLES normalize to the same idle since no wanna head turn
    [CHAR_ANIM_IDLE_HEAD_CENTER] = 'DT_IDLE',
    [CHAR_ANIM_IDLE_HEAD_LEFT] = 'DT_IDLE',
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = 'DT_IDLE',
    [CHAR_ANIM_SLEEP_START_LYING] = 'DT_SLEEP',
    [CHAR_ANIM_SLEEP_LYING] = 'DT_SLEEP_LAID_DOWN',
    [CHAR_ANIM_SINGLE_JUMP] = 'DT_JUMP',
    --[CHAR_ANIM_DOUBLE_JUMP_RISE] = 'DT_JUMP',
    --[CHAR_ANIM_DOUBLE_JUMP_FALL] = 'DT_DOUBLE',
    [CHAR_ANIM_TRIPLE_JUMP] = 'DT_TRIPLE',
    --CROUCH also normalized
    [CHAR_ANIM_CROUCHING] = 'DT_CROUCH',
    [CHAR_ANIM_START_CROUCHING] = 'DT_CROUCH_START',
    [CHAR_ANIM_CRAWLING] = 'DT_WADDLE',
    [CHAR_ANIM_START_CRAWLING] = 'DT_CROUCH_ENDS',
    [CHAR_ANIM_STOP_CRAWLING] = 'DT_CROUCH',
}


CHAR_DAVEY_TOOIE = _G.charSelect.character_add(
    "Davey Tooie", -- Character Name
    "", -- Description
    "Honi", -- Credits
    "9F26FC",           -- Menu Color
    E_MODEL_DAVEYT,       -- Character Model
    CT_TOAD,           -- Override Character
    TEX_ICON_DAVEYT, -- Life Icon
    1                  -- Camera Scale
)
charSelect.character_add_graffiti(CHAR_DAVEY_TOOIE, DAVEYT_GRAFFITI)
charSelect.character_add_caps(E_MODEL_DAVEYT, CAPS_DT)
charSelect.character_add_animations(E_MODEL_DAVEYT, animsDT)

CHAR_DEW = _G.charSelect.character_add(
    "Dew", -- Character Name
    "", -- Description
    "Honi", -- Credits
    "9F26FC",           -- Menu Color
    E_MODEL_DEW,       -- Character Model
    CT_LUIGI,           -- Override Character
    TEX_ICON_DEW, -- Life Icon
    1                  -- Camera Scale
)
charSelect.character_add_caps(E_MODEL_DEW, CAPS_DEW)