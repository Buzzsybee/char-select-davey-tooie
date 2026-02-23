-- name: [CS] Davey Tooie
-- description:

local TEXT_MOD_NAME = "[CS] Davey Tooie"

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

local E_MODEL_DAVEYT = smlua_model_util_get_id("daveyt_geo")
local TEX_ICON_DAVEYT = get_texture_info("daveyt_icon")
local DAVEYT_GRAFFITI = get_texture_info("daveytoo_graffiti")

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