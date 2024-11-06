/// @description Insert description here
// You can write your code in this editor

repeat (10) {instance_create_layer(x,y,"Player",oDust)};
with instance_create_layer(x,y,"Player",oSentry){image_xscale = other.image_xscale};

instance_destroy();




