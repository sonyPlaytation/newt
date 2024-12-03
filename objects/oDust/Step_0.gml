/// @description Insert description here
// You can write your code in this editor

if !sizeChosen
{
	image_xscale = choose(size,-size);
	image_yscale = choose(size,-size);	
	sizeChosen = true;
}

hsp = lengthdir_x(spd*size, dir);
vsp = lengthdir_y(spd*size, dir);

x += hsp;
y += vsp;

spd*=0.9;

if grow != 0 
{
	size *= grow
	image_xscale = choose(size,-size);
	image_yscale = choose(size,-size);	
};
