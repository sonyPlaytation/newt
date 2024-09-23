/// @description Insert description here
// You can write your code in this editor

corpse = "";
charred = false;
fresh = 1000;
digest = 600;

sprite = 0;
size = 1;
rot = 0;
col = c_white;
alpha = 1;
done = 0;

flash = 3;
hsp = 0;
vsp = -5;
grv = 0.3;


multiplier = choose(3,3,3,4,6);
repeat(size*multiplier){instance_create_layer(x,bbox_bottom, "Player", oSpookyGhost)};
expGive(size,multiplier);
screenShake(3,15);

inactive = false;

if size > 1 {big = true} else big = false;
inBelly = false;

image_speed = 0;

dropRate = 10;

if (oInv.hpMissing != 0)
{
	if (irandom_range(1,100) <= dropRate + max(oInv.hpMissing,10))
		{
			with instance_create_layer(x,y-3,"Player",oHealthGet){vsp = -6};
		}
}

corpsePicked = false;


