/// @description Insert description here
// You can write your code in this editor

depth = instance_nearest(x,y,oDmgNum).depth +1;

if instance_exists(owner)
{
x = owner.x
y = (owner.y - owner.sprite_height)
}
else
{
lift -= 0.008;
x = x;
y = y + lift;
}

image_alpha -= 0.01;

if image_alpha < 0 {instance_destroy()};