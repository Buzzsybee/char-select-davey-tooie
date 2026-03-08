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
local DEW_GRAFFITI = get_texture_info("dew_graffiti")

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

animsDT = {
    [CHAR_ANIM_RUNNING] = 'DT_RUN',
    --IDLES normalize to the same idle since no wanna head turn
    [CHAR_ANIM_IDLE_HEAD_CENTER] = 'DT_IDLE',
    [CHAR_ANIM_IDLE_HEAD_LEFT] = 'DT_IDLE',
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = 'DT_IDLE',
    [CHAR_ANIM_FIRST_PERSON] = 'DT_IDLE',
    [CHAR_ANIM_SLEEP_START_LYING] = 'DT_SLEEP',
    [CHAR_ANIM_SLEEP_LYING] = 'DT_SLEEP_LAID_DOWN',
    [CHAR_ANIM_SINGLE_JUMP] = 'DT_JUMP',
    --[CHAR_ANIM_DOUBLE_JUMP_RISE] = 'DT_JUMP',
    --[CHAR_ANIM_DOUBLE_JUMP_FALL] = 'DT_DOUBLE',
    [CHAR_ANIM_TRIPLE_JUMP] = 'DT_TRIPLE',
    --CROUCH also normalized
    [CHAR_ANIM_CROUCHING] = 'DT_CROUCH',
    [CHAR_ANIM_START_CROUCHING] = 'DT_CROUCH_START',
    [CHAR_ANIM_STOP_CROUCHING] = 'DT_CROUCH_ENDS',
    [CHAR_ANIM_CRAWLING] = 'DT_WADDLE',
    [CHAR_ANIM_START_CRAWLING] = 'DT_CROUCH_ENDS',
    [CHAR_ANIM_STOP_CRAWLING] = 'DT_CROUCH_ENDS',
}

VOICETABLE_TOOIE = {
    [CHAR_SOUND_ATTACKED] = {'tooie_attacked.ogg', 'tooie_attacked2.ogg', 'tooie_attacked3.ogg', 'tooie_attacked4.ogg', 'tooie_attacked5.ogg', 'tooie_attacked6.ogg', 'tooie_attacked7.ogg', 'tooie_attacked8.ogg', 'tooie_attacked9.ogg', 'tooie_attacked10.ogg'},
    [CHAR_SOUND_COUGHING1] = 'tooie_coughing1.ogg',
    [CHAR_SOUND_COUGHING2] = 'tooie_coughing2.ogg',
    [CHAR_SOUND_COUGHING3] = 'tooie_coughing3.ogg',
    [CHAR_SOUND_DOH] = 'tooie_doh.ogg',
    [CHAR_SOUND_DROWNING] = 'tooie_drowning.ogg',
    [CHAR_SOUND_DYING] = {'tooie_dying.ogg', 'tooie_dying2.ogg', 'tooie_dying3.ogg', 'tooie_dying4.ogg', 'tooie_dying5.ogg', 'tooie_dying6.ogg', 'tooie_dying7.ogg', 'tooie_dying8.ogg', 'tooie_dying9.ogg', 'tooie_dying10.ogg', 'tooie_dying11.ogg', 'tooie_dying12.ogg', 'tooie_dying13.ogg'},
    [CHAR_SOUND_EEUH] = 'tooie_eeuh.ogg',
	[CHAR_SOUND_GAME_OVER] = 'tooie_game_over.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'tooie_ground_pound_wah.ogg',
    [CHAR_SOUND_HAHA] = 'tooie_haha.ogg',
    [CHAR_SOUND_HAHA_2] = 'tooie_haha2.ogg',
	[CHAR_SOUND_HELLO] = 'tooie_hello.ogg',
    [CHAR_SOUND_HERE_WE_GO] = {'tooie_here_we_go.ogg', 'tooie_here_we_go2.ogg', 'tooie_here_we_go3.ogg', 'tooie_here_we_go4.ogg', 'tooie_here_we_go5.ogg', 'tooie_here_we_go6.ogg', 'tooie_here_we_go7.ogg', 'tooie_here_we_go8.ogg', 'tooie_here_we_go9.ogg', 'tooie_here_we_go10.ogg', 'tooie_here_we_go11.ogg', 'tooie_here_we_go12.ogg', 'tooie_here_we_go13.ogg', 'tooie_here_we_go14.ogg'},
    [CHAR_SOUND_HOOHOO] = 'tooie_hoohoo.ogg',
    [CHAR_SOUND_HRMM] = 'tooie_hrmm.ogg',
	[CHAR_SOUND_IMA_TIRED] = 'tooie_ima_tired.ogg',
    [CHAR_SOUND_MAMA_MIA] = {'tooie_mama_mia.ogg', 'tooie_mama_mia2.ogg', 'tooie_mama_mia3.ogg', 'tooie_mama_mia4.ogg', 'tooie_mama_mia5.ogg', 'tooie_mama_mia6.ogg', 'tooie_mama_mia7.ogg', 'tooie_mama_mia8.ogg', 'tooie_mama_mia9.ogg', 'tooie_mama_mia10.ogg', 'tooie_mama_mia11.ogg', 'tooie_mama_mia12.ogg', 'tooie_mama_mia13.ogg', 'tooie_mama_mia14.ogg', 'tooie_mama_mia15.ogg', 'tooie_mama_mia16.ogg', 'tooie_mama_mia17.ogg', 'tooie_mama_mia18.ogg', 'tooie_mama_mia19.ogg', 'tooie_mama_mia20.ogg', 'tooie_mama_mia21.ogg', 'tooie_mama_mia22.ogg', 'tooie_mama_mia23.ogg', 'tooie_mama_mia24.ogg', 'tooie_mama_mia25.ogg', 'tooie_mama_mia26.ogg', 'tooie_mama_mia27.ogg', 'tooie_mama_mia28.ogg', 'tooie_mama_mia29.ogg', 'tooie_mama_mia30.ogg', 'tooie_mama_mia31.ogg', 'tooie_mama_mia32.ogg', 'tooie_mama_mia33.ogg', 'tooie_mama_mia34.ogg', 'tooie_mama_mia35.ogg', 'tooie_mama_mia36.ogg', 'tooie_mama_mia37.ogg', 'tooie_mama_mia38.ogg', 'tooie_mama_mia39.ogg', 'tooie_mama_mia40.ogg', 'tooie_mama_mia41.ogg', 'tooie_mama_mia42.ogg', 'tooie_mama_mia43.ogg', 'tooie_mama_mia44.ogg', 'tooie_mama_mia45.ogg', 'tooie_mama_mia46.ogg', 'tooie_mama_mia47.ogg', 'tooie_mama_mia48.ogg', 'tooie_mama_mia49.ogg', 'tooie_mama_mia50.ogg', 'tooie_mama_mia51.ogg', 'tooie_mama_mia52.ogg', 'tooie_mama_mia53.ogg', 'tooie_mama_mia54.ogg', 'tooie_mama_mia55.ogg', 'tooie_mama_mia56.ogg', 'tooie_mama_mia57.ogg', 'tooie_mama_mia58.ogg', 'tooie_mama_mia59.ogg', 'tooie_mama_mia60.ogg'},
    [CHAR_SOUND_LETS_A_GO] = {'tooie_lets_a_go.ogg', 'tooie_lets_a_go2.ogg', 'tooie_lets_a_go3.ogg', 'tooie_lets_a_go4.ogg', 'tooie_lets_a_go5.ogg', 'tooie_lets_a_go6.ogg'},
    [CHAR_SOUND_ON_FIRE] = {'tooie_on_fire.ogg', 'tooie_on_fire2.ogg'},
    [CHAR_SOUND_OOOF] = 'tooie_oof.ogg',
    [CHAR_SOUND_OOOF2] = 'tooie_oof2.ogg',
    [CHAR_SOUND_PANTING] = {'tooie_panting1.ogg', 'tooie_panting2.ogg', 'tooie_panting3.ogg'},
	[CHAR_SOUND_PANTING_COLD] = 'tooie_panting4.ogg',
	[CHAR_SOUND_PRESS_START_TO_PLAY] = 'tooie_press_start_to_play.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'tooie_punch_hoo.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'tooie_punch_wah.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'tooie_punch_yah.ogg',
	[CHAR_SOUND_SNORING1] = 'tooie_snore1_1.ogg',
    [CHAR_SOUND_SNORING2] = 'tooie_snore2_1.ogg',
    [CHAR_SOUND_SNORING3] = {'tooie_snore1_2.ogg', 'tooie_snore2_2.ogg', 'tooie_sleeptalking.ogg'},
    [CHAR_SOUND_SO_LONGA_BOWSER] = {'tooie_solonga_bowser.ogg', 'tooie_solonga_bowser2.ogg', 'tooie_solonga_bowser3.ogg', 'tooie_solonga_bowser4.ogg', 'tooie_solonga_bowser5.ogg', 'tooie_solonga_bowser6.ogg', 'tooie_solonga_bowser7.ogg', 'tooie_solonga_bowser8.ogg', 'tooie_solonga_bowser9.ogg', 'tooie_solonga_bowser10.ogg'},
    [CHAR_SOUND_TWIRL_BOUNCE] = 'tooie_twirl_bounce.ogg',
    [CHAR_SOUND_UH] = 'tooie_uh.ogg',
    [CHAR_SOUND_UH2] = 'tooie_uh2.ogg',
    [CHAR_SOUND_UH2_2] = 'tooie_uh2_2.ogg',
    [CHAR_SOUND_WAAAOOOW] = {'tooie_waaaooow.ogg', 'tooie_waaaooow2.ogg', 'tooie_waaaooow3.ogg', 'tooie_waaaooow4.ogg'},
    [CHAR_SOUND_WAH2] = 'tooie_yah2.ogg',
    [CHAR_SOUND_WHOA] = {'tooie_woah.ogg', 'tooie_woah2.ogg', 'tooie_woah3.ogg', 'tooie_woah4.ogg'},
    [CHAR_SOUND_YAHOO] = 'tooie_yipee1.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'tooie_yipee.ogg', 'tooie_yipee1.ogg', 'tooie_yipee2.ogg', 'tooie_yipee3.ogg', 'tooie_yipee4.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'tooie_yah1.ogg', 'tooie_yah2.ogg', 'tooie_yah3.ogg', 'tooie_yah4.ogg'},
}

animsDew = {
    --[CHAR_ANIM_RUNNING] = 'DT_RUN',
    --IDLES normalize to the same idle since no wanna head turn
    [CHAR_ANIM_IDLE_HEAD_CENTER] = 'DT_IDLE',
    [CHAR_ANIM_IDLE_HEAD_LEFT] = 'DT_IDLE',
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = 'DT_IDLE',
    [CHAR_ANIM_FIRST_PERSON] = 'DT_IDLE',
    [CHAR_ANIM_SLEEP_START_LYING] = 'DT_SLEEP',
    [CHAR_ANIM_SLEEP_LYING] = 'DT_SLEEP_LAID_DOWN',
    [CHAR_ANIM_SINGLE_JUMP] = 'DT_JUMP',
    --[CHAR_ANIM_DOUBLE_JUMP_RISE] = 'DT_JUMP',
    --[CHAR_ANIM_DOUBLE_JUMP_FALL] = 'DT_DOUBLE',
    [CHAR_ANIM_TRIPLE_JUMP] = 'DT_TRIPLE',
    --CROUCH also normalized
    [CHAR_ANIM_CROUCHING] = 'DT_CROUCH',
    [CHAR_ANIM_START_CROUCHING] = 'DT_CROUCH_START',
    [CHAR_ANIM_STOP_CROUCHING] = 'DT_CROUCH_ENDS',
    [CHAR_ANIM_CRAWLING] = 'DT_WADDLE',
    [CHAR_ANIM_START_CRAWLING] = 'DT_CROUCH_ENDS',
    [CHAR_ANIM_STOP_CRAWLING] = 'DT_CROUCH_ENDS',
}

VOICETABLE_DEW = {
    [CHAR_SOUND_ATTACKED] = {'dew_attacked.ogg', 'dew_attacked2.ogg', 'dew_attacked3.ogg'},
    [CHAR_SOUND_COUGHING1] = 'dew_coughing1.ogg',
    [CHAR_SOUND_COUGHING2] = 'dew_coughing2.ogg',
    [CHAR_SOUND_COUGHING3] = 'dew_coughing3.ogg',
    [CHAR_SOUND_DOH] = 'dew_doh.ogg',
    [CHAR_SOUND_DROWNING] = 'dew_drowning.ogg',
    [CHAR_SOUND_DYING] = {'dew_dying.ogg', 'dew_dying2.ogg'},
    [CHAR_SOUND_EEUH] = 'dew_eeuh.ogg',
	[CHAR_SOUND_GAME_OVER] = 'dew_game_over.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'dew_ground_pound_wah.ogg',
    [CHAR_SOUND_HAHA] = 'dew_haha.ogg',
    [CHAR_SOUND_HAHA_2] = 'dew_haha2.ogg',
	[CHAR_SOUND_HELLO] = 'dew_hello.ogg',
    [CHAR_SOUND_HERE_WE_GO] = {'dew_here_we_go.ogg', 'dew_here_we_go2.ogg', 'dew_here_we_go3.ogg'},
    [CHAR_SOUND_HOOHOO] = 'dew_hoohoo.ogg',
    [CHAR_SOUND_HRMM] = 'dew_hrmm.ogg',
	[CHAR_SOUND_IMA_TIRED] = 'dew_ima_tired.ogg',
    [CHAR_SOUND_MAMA_MIA] = {'dew_mama_mia.ogg', 'dew_mama_mia2.ogg', 'dew_mama_mia3.ogg'},
    [CHAR_SOUND_LETS_A_GO] = {'dew_lets_a_go.ogg', 'dew_lets_a_go2.ogg', 'dew_lets_a_go3.ogg', 'dew_lets_a_go4.ogg'},
    [CHAR_SOUND_ON_FIRE] = {'dew_on_fire.ogg', 'dew_on_fire2.ogg', 'dew_on_fire3.ogg'},
    [CHAR_SOUND_OOOF] = 'dew_oof.ogg',
    [CHAR_SOUND_OOOF2] = 'dew_oof2.ogg',
    [CHAR_SOUND_PANTING] = {'dew_panting1.ogg', 'dew_panting2.ogg', 'dew_panting3.ogg'},
	[CHAR_SOUND_PANTING_COLD] = 'dew_panting4.ogg',
	[CHAR_SOUND_PRESS_START_TO_PLAY] = 'dew_press_start_to_play.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'dew_punch_hoo.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'dew_punch_wah.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'dew_punch_yah.ogg',
	[CHAR_SOUND_SNORING1] = 'dew_snore1_1.ogg',
    [CHAR_SOUND_SNORING2] = 'dew_snore2_1.ogg',
    [CHAR_SOUND_SNORING3] = {'dew_snore1_2.ogg', 'dew_snore2_2.ogg', 'dew_sleeptalking.ogg'},
    [CHAR_SOUND_SO_LONGA_BOWSER] = {'dew_so_longa_bowser.ogg', 'dew_so_longa_bowser2.ogg', 'dew_so_longa_bowser3.ogg', 'dew_so_longa_bowser4.ogg'},
    [CHAR_SOUND_TWIRL_BOUNCE] = 'dew_twirl_bounce.ogg',
    [CHAR_SOUND_UH] = 'dew_uh.ogg',
    [CHAR_SOUND_UH2] = 'dew_uh2.ogg',
    [CHAR_SOUND_UH2_2] = 'dew_uh2_2.ogg',
    [CHAR_SOUND_WAAAOOOW] = {'dew_waaaooow.ogg', 'dew_waaaooow2.ogg'},
    [CHAR_SOUND_WAH2] = 'dew_yah2.ogg',
    [CHAR_SOUND_WHOA] = {'dew_woah.ogg', 'dew_woah2.ogg'},
    [CHAR_SOUND_YAHOO] = 'dew_yipee1.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'dew_yipee.ogg', 'dew_yipee1.ogg', 'dew_yipee2.ogg', 'dew_yipee3.ogg', 'dew_yipee4.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'dew_yah1.ogg', 'dew_yah2.ogg', 'dew_yah3.ogg', 'dew_yah4.ogg'},
}


CHAR_DAVEY_TOOIE = _G.charSelect.character_add(
    "Davey Tooie", -- Character Name
    "", -- Description
    "Honi", -- Credits
    "9F26FC",           -- Menu Color
    E_MODEL_DAVEYT,       -- Character Model
    CT_MARIO,           -- Override Character
    TEX_ICON_DAVEYT, -- Life Icon
    1                  -- Camera Scale
)
charSelect.character_add_graffiti(CHAR_DAVEY_TOOIE, DAVEYT_GRAFFITI)
--charSelect.character_add_caps(E_MODEL_DAVEYT, CAPS_DT)
charSelect.character_add_animations(E_MODEL_DAVEYT, animsDT)
charSelect.character_add_voice(E_MODEL_DAVEYT, VOICETABLE_TOOIE)

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
charSelect.character_add_voice(E_MODEL_DEW, VOICETABLE_DEW)
charSelect.character_add_animations(E_MODEL_DEW, animsDew)
charSelect.character_add_graffiti(CHAR_DEW, DEW_GRAFFITI)