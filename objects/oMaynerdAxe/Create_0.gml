/// @description

// Inherit the parent event
event_inherited();

image_xscale = oBossMaynerd.image_xscale;

grv = 0.3
vsp = -10;
damage = 1;

homing = choose(true,false);

if (homing) {color = c_fuchsia} else color = c_white;

if instance_exists(oNewt) {range = point_distance(oNewt.x, oNewt.y, oBossMaynerd.x, oBossMaynerd.y)};

hsp = range/70*image_xscale;