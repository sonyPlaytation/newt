/// @description Insert description here
// You can write your code in this editor

image_angle = 1;

hp = 9999	
vsp = 1;
hsp = irandom_range(-0.5,0.5);
spd = 1;
inactive = false;
flash = 3;
grv = 0.2;
screenShake(3,15);

multiplier = choose(1,1,1,1,2);

size = 1;

imgRot = 2;

expGive();

if (oHealthBar.hpMissing != 0)
{
	if (irandom_range(1,100) <= dropRate + max(oHealthBar.hpMissing,10))
		{
			instance_create_layer(x,y-3,"Player",oHealthGet);
			instance_nearest(x,y,oHealthGet).vsp = -6;
		
		}
}