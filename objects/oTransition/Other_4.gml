/// @description Insert description here
// You can write your code in this editor

if !layer_exists("Shots"){layer_create(-999,"Shots")}

var fBgTint = fx_create("_filter_tintfilter");
fx_set_parameter(fBgTint,"g_TintCol",[0.549,0.541,0.639,0.45]);
layer_set_fx(layer_get_id("Background"),fBgTint);


var fShotGlow = fx_create("_effect_glow");
fx_set_single_layer(fShotGlow,true);
fx_set_parameter(fShotGlow,"g_GlowIntensity",0.65);
layer_set_fx(layer_get_id("Shots"),fShotGlow);







