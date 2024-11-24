/// @description Insert description here
// You can write your code in this editor

outline_init();
width = 4;
slim = 1;
color = c_white;

done = 0;
hsp = 0;
vsp = -7;
grv = 0.3;
dir = 0;
spd = 30;

dltTimer = 10 * 60;

parried = false;

baseDMG = 45*oInv.dmgMod;

image_angle = irandom(359);

image_xscale = 2;
image_yscale = 2;

//alarm[0] = 120

if (instance_exists(oNewt)) depth = oNewt.depth-50;

stateToss = function()
{
	vsp = vsp + grv;
	image_angle += abs(vsp)
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		if (vsp > 0) 
		{
			state = stateIdle
		}
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
	baseDMG += 3;
	//screen pause
	if screenPause() {exit;};

	hsp = lengthdir_x(spd, dir);
	vsp = vsp + grv;

	//horizontal collision
	if (place_meeting(x+hsp,y,oCollide))
		{
			while (!place_meeting(x+sign(hsp),y,oCollide))
			{
				x = x + sign(hsp)
			}
			hsp = -hsp;
			vsp = 0;
			state = stateIdle;
			alarm[0] = dltTimer;
			outline_end();
		}

	x += hsp;
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		vsp = 0;
		state = stateIdle;
		alarm[0] = dltTimer;
		outline_end();
	}
	
	y += vsp;

	image_angle += abs(vsp)
	spd = max(15, spd*0.97);
	
	if (place_meeting(x,y,pEntity)) 
	{
		var target = (instance_place(x,y,pEntity));
	
		with target
		{
		
			if !inactive
			{
				diedFrom = "baseball";
				//damage calculation
				finalDMG = other.baseDMG;
				
				//subtract health
				hp -= finalDMG;
			
				//damage numbers
				if (!noDMG)
				{
					repeat(irandom_range(3,8)) {(instance_create_layer(target.x,target.y, "Player", oBlood))}
					myDamage.damage += finalDMG;
					myDamage.alpha = 1;
					myDamage.dmgTextScale = 0.75
				}
				global.critTotalDMG += finalDMG			
				flash = 3;
				hitfrom = other.direction;
				
			}
		}
		vsp = 0;
		hsp = -hsp/5;
		state = stateIdle;
		outline_end();
	}
	
}

stateIdle = function()
{		
	onGround = false;
		
	if collision_circle(x,y,45,oNewt,1,1)
	{
		oWeapon.delayRight = 0;
		oSFX.ballgrab = true;
		instance_destroy();
	}
	
	vsp = vsp + grv;
	image_angle -= hsp*8;
	
	//horizontal collision
	if (place_meeting(x+hsp,y-5,oCollide))
	{
		while (!place_meeting(x+sign(hsp),y,oCollide))
		{
			x += sign(hsp)
		}
		if !onGround {hsp = -hsp/2; hsp -= 0.02};
	}
	x += hsp;
	
	//vertical collision
	if (place_meeting(x,y+vsp,oCollide))
	{
		while (!place_meeting(x,y+sign(vsp),oCollide))
		{
			y += sign(vsp)
		}
		onGround = true;
		vsp = 0;
	}
	
	y += vsp;
	
}

state = stateToss;