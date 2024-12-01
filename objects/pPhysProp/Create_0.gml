/// @description Insert description here
// You can write your code in this editor

physics_world_create(0.1);
physics_world_gravity(0, 100);
phy_active = false;

event_inherited();

captured = false;

width = sprite_height/2;
slim = 1;
color = c_white;

damage = 3;
idleTimer = 0;

dieSound = snBelch;

fragile = false;
debris = false;