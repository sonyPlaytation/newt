/// @description Insert description here
// You can write your code in this editor

rot = 0;
col = c_white;
alpha = 1;
sprite = sExplosion;

friendly = 1;

baseDMG = 65;

radius = 250;
dustRad = radius/25;

crit = false;

pushDistH = 0;
pushDistV = 0;
pushAng = 0;

dist = 0;
image_index = 0;

diedFrom = "overkill";

audio_play_sound(snHL1Explosion,600,false)
//repeat(radius/10)
//{
//	with (instance_create_layer(x,y, "Player", oDust))
//	{hsp = random_range(-other.dustRad,other.dustRad)
//	vsp = random_range(-other.dustRad,other.dustRad);}
//}

screenShake(35,35);

