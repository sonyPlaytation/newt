/// @description Insert description here
// You can write your code in this editor



myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
with (myDamage)
{
	owner = other.id		
}

audio_play_sound(choose(snMarksCoin1,snMarksCoin2),740,false);

outline_init();
width = 4;
slim = 1;
color = c_yellow;

done = 0;
grv = 0.15;
dir = 0;
spd = 7;

hsp = 0;
vsp = 0;

x += hsp;
y += vsp;

oMultiWeapon.coinCount--;

baseDMG = 0;
coinHit = false;

image_angle = irandom(359);

alarm[0] = 12;

if (instance_exists(oNewt)) depth = oNewt.depth-50;

stateToss = function()
{
	coinHit = false
	x+=hsp;
	hsp*=0.98;
	vsp = vsp + grv;
	image_angle += abs(vsp)
	
	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;	
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;		
}

stateFly = function()
{
	//screen pause
	if screenPause() {exit;};

	if coinHit
	{
		baseDMG = maxHP-hp;
		state = stateRicochet;
		oSFX.ricoshot = true
	}

	x+=hsp;
	vsp = vsp + grv;
	image_angle += abs(vsp)
	
	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
	{
		instance_destroy();
	}
	x += hsp;	
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		instance_destroy();
	}
	y += vsp;	
	
	
}

stateRicochet = function()
{	
	hitStop(1);
	instance_destroy();
	if instance_exists(oMarksCoin)
	{
		var _target = instance_nearest(x,y,oMarksCoin)
		with (instance_create_layer(x,y,"Shots",oShotHitscan))
		{
			headshot = true;
			baseDMG = ceil(other.baseDMG * 1.25);
			hitSprite = oMultiWeapon.hitSprite;
			col = c_yellow;
			crit = false;
			dir = point_direction(x,y,_target.x,_target.y)
			spd = 0;
			image_angle = dir;
		}
	}
	else
	{
		if instance_exists(pEntity)
		{
			var _target = instance_nearest(x,y,pEntity)
			with (instance_create_layer(x,y,"Shots",oShotHitscan))
			{
				headshot = true;
				baseDMG = other.baseDMG;
				hitSprite = oMultiWeapon.hitSprite;
				col = c_yellow;
				crit = false;
				dir = point_direction(x,y,_target.x,_target.bbox_top)
				spd = 0;
				image_angle = dir;
			}
		}
	}
}

state = stateToss;





















