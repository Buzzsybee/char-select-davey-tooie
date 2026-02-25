Lights1 normal_dt_clip_lights = gdSPDefLights1(
	0x7F, 0x66, 0x0,
	0xFF, 0xCE, 0x1, 0x28, 0x28, 0x28);

Texture normal_dt_CLIP_rgba16[] = {
	#include "actors/normal_dt/CLIP.rgba16.inc.c"
};

Vtx normal_dt_Cap_DL_mesh_layer_1_vtx_0[32] = {
	{{{-34, 28, -63}, 0, {1273, 623}, {0xAE, 0x51, 0xCB, 0xFF}}},
	{{{0, 28, -67}, 0, {2032, 538}, {0x00, 0x7F, 0x01, 0xFF}}},
	{{{0, 28, -89}, 0, {2032, 39}, {0x00, 0x4B, 0x9A, 0xFF}}},
	{{{-15, 28, -55}, 0, {1694, 798}, {0xFF, 0x7E, 0x12, 0xFF}}},
	{{{-48, 28, 0}, 0, {958, 2032}, {0xA1, 0x54, 0x00, 0xFF}}},
	{{{-34, 20, -63}, 0, {1273, 623}, {0xAE, 0xAF, 0xCB, 0xFF}}},
	{{{0, 20, -89}, 0, {2032, 39}, {0x00, 0xB5, 0x9A, 0xFF}}},
	{{{34, 20, -63}, 0, {2791, 623}, {0x52, 0xAF, 0xCB, 0xFF}}},
	{{{34, 28, -63}, 0, {2791, 623}, {0x52, 0x51, 0xCB, 0xFF}}},
	{{{16, 28, -55}, 0, {2386, 810}, {0x01, 0x7E, 0x11, 0xFF}}},
	{{{0, 24, 67}, 0, {2032, 3526}, {0x00, 0x00, 0x7F, 0xFF}}},
	{{{-15, 20, -55}, 0, {1694, 798}, {0xFF, 0x82, 0x12, 0xFF}}},
	{{{-36, 20, 0}, 0, {1227, 2032}, {0x50, 0x9D, 0x06, 0xFF}}},
	{{{-36, 28, 0}, 0, {1227, 2032}, {0x50, 0x63, 0x06, 0xFF}}},
	{{{-34, 28, 63}, 0, {1273, 3441}, {0xB0, 0x55, 0x33, 0xFF}}},
	{{{-48, 20, 0}, 0, {958, 2032}, {0xA1, 0xAC, 0x00, 0xFF}}},
	{{{0, 20, -67}, 0, {2032, 538}, {0x00, 0x81, 0x01, 0xFF}}},
	{{{16, 20, -55}, 0, {2386, 810}, {0x01, 0x82, 0x11, 0xFF}}},
	{{{36, 20, 0}, 0, {2837, 2032}, {0xB0, 0x9D, 0x05, 0xFF}}},
	{{{48, 20, 0}, 0, {3106, 2032}, {0x5F, 0xAC, 0x00, 0xFF}}},
	{{{48, 28, 0}, 0, {3106, 2032}, {0x5F, 0x54, 0x00, 0xFF}}},
	{{{36, 28, 0}, 0, {2837, 2032}, {0xB0, 0x63, 0x05, 0xFF}}},
	{{{25, 28, 47}, 0, {2601, 3089}, {0xBD, 0x63, 0xD7, 0xFF}}},
	{{{25, 20, 47}, 0, {2601, 3089}, {0xBD, 0x9D, 0xD7, 0xFF}}},
	{{{34, 20, 63}, 0, {2791, 3441}, {0x50, 0xAB, 0x33, 0xFF}}},
	{{{34, 28, 63}, 0, {2791, 3441}, {0x50, 0x55, 0x33, 0xFF}}},
	{{{0, 24, 67}, 0, {2032, 3526}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{0, 20, 89}, 0, {2032, 4025}, {0x00, 0xB2, 0x64, 0xFF}}},
	{{{0, 28, 89}, 0, {2032, 4025}, {0x00, 0x4E, 0x64, 0xFF}}},
	{{{-25, 28, 47}, 0, {1463, 3089}, {0x43, 0x63, 0xD7, 0xFF}}},
	{{{-25, 20, 47}, 0, {1463, 3089}, {0x43, 0x9D, 0xD7, 0xFF}}},
	{{{-34, 20, 63}, 0, {1273, 3441}, {0xB0, 0xAB, 0x33, 0xFF}}},
};

Gfx normal_dt_Cap_DL_mesh_layer_1_tri_0[] = {
	gsSPVertex(normal_dt_Cap_DL_mesh_layer_1_vtx_0 + 0, 32, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(4, 3, 0, 0, 4, 0, 5, 0),
	gsSP2Triangles(0, 6, 5, 0, 0, 2, 6, 0),
	gsSP2Triangles(2, 7, 6, 0, 2, 8, 7, 0),
	gsSP2Triangles(2, 9, 8, 0, 2, 1, 9, 0),
	gsSP2Triangles(1, 10, 9, 0, 1, 3, 10, 0),
	gsSP2Triangles(10, 3, 11, 0, 3, 12, 11, 0),
	gsSP2Triangles(3, 13, 12, 0, 4, 13, 3, 0),
	gsSP2Triangles(14, 13, 4, 0, 14, 4, 15, 0),
	gsSP2Triangles(4, 5, 15, 0, 15, 5, 11, 0),
	gsSP2Triangles(5, 16, 11, 0, 5, 6, 16, 0),
	gsSP2Triangles(6, 17, 16, 0, 6, 7, 17, 0),
	gsSP2Triangles(7, 18, 17, 0, 7, 19, 18, 0),
	gsSP2Triangles(8, 19, 7, 0, 8, 20, 19, 0),
	gsSP2Triangles(8, 21, 20, 0, 8, 9, 21, 0),
	gsSP2Triangles(21, 9, 17, 0, 9, 10, 17, 0),
	gsSP2Triangles(16, 17, 10, 0, 16, 10, 11, 0),
	gsSP2Triangles(21, 17, 18, 0, 22, 21, 18, 0),
	gsSP2Triangles(22, 18, 23, 0, 19, 23, 18, 0),
	gsSP2Triangles(19, 24, 23, 0, 20, 24, 19, 0),
	gsSP2Triangles(20, 25, 24, 0, 20, 22, 25, 0),
	gsSP2Triangles(20, 21, 22, 0, 25, 22, 26, 0),
	gsSP2Triangles(26, 22, 23, 0, 24, 26, 23, 0),
	gsSP2Triangles(24, 27, 26, 0, 25, 27, 24, 0),
	gsSP2Triangles(25, 28, 27, 0, 25, 26, 28, 0),
	gsSP2Triangles(28, 26, 29, 0, 29, 26, 30, 0),
	gsSP2Triangles(27, 30, 26, 0, 27, 31, 30, 0),
	gsSP2Triangles(28, 31, 27, 0, 28, 14, 31, 0),
	gsSP2Triangles(28, 29, 14, 0, 14, 29, 13, 0),
	gsSP2Triangles(13, 29, 30, 0, 13, 30, 12, 0),
	gsSP2Triangles(31, 12, 30, 0, 31, 15, 12, 0),
	gsSP2Triangles(14, 15, 31, 0, 15, 11, 12, 0),
	gsSPEndDisplayList(),
};


Gfx mat_normal_dt_clip[] = {
	gsSPCopyLightsPlayerPart(CAP),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, SHADE, TEXEL0_ALPHA, SHADE, 0, 0, 0, ENVIRONMENT, TEXEL0, SHADE, TEXEL0_ALPHA, SHADE, 0, 0, 0, ENVIRONMENT),
	gsDPSetAlphaDither(G_AD_NOISE),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, normal_dt_CLIP_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 16383, 64),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 7, 0),
	gsDPSetTileSize(0, 0, 0, 508, 508),
	gsSPEndDisplayList(),
};

Gfx mat_revert_normal_dt_clip[] = {
	gsDPPipeSync(),
	gsDPSetAlphaDither(G_AD_DISABLE),
	gsSPEndDisplayList(),
};

Gfx normal_dt_Cap_DL_mesh_layer_1[] = {
	gsSPDisplayList(mat_normal_dt_clip),
	gsSPDisplayList(normal_dt_Cap_DL_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_revert_normal_dt_clip),
	gsSPEndDisplayList(),
};

Gfx normal_dt_material_revert_render_settings[] = {
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP  | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, 0),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 256, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(6, 0, 0, 1023, 256),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 256, 1, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(1, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

