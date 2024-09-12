/// @description Insert description here
// You can write your code in this editor



alarm[0] = 10;

hit = false;

sprW = 0;
sprH = 60;

image_xscale = sprW/2;
image_yscale = sprH/2;

_hs = max (0, oMultiWeapon.cooldown-2)

stateSwat = function()
{
	//hitting an enemy
	if (place_meeting(x,y,pEntity))
	{
		var target = other.id;
		with(instance_place(x,y,pEntity))
		{
			diedFrom = "standard";
			baseDMG = ceil(mean(oMultiWeapon.damage + abs(oNewt.hsp/5),oMultiWeapon.damage*1.5))
			hp -= baseDMG;
			if (!noDMG)
			{
				myDamage.damage += baseDMG;
				myDamage.alpha = 1;
				myDamage.dmgTextScale = 0.75
				
			}
			flash = 3;			
			hitfrom = other.direction;
		}
		hitStop(_hs);
		instance_destroy();
	}
	
	//projectile Swat
	if (place_meeting(x,y,oEnemyShot))
	{	
		with(instance_place(x,y,oEnemyShot))
		{
			x = other.x;
			y = other.y;
			if !friendly {oSFX.baseballcrack = true;}
			friendly = true;
			parried = false;
			image_angle = other.image_angle;
			dir = image_angle;
		}
		hitStop(_hs);
		instance_destroy();
	}
	
	//hitting a baseball
	if (place_meeting(x,y,oBaseball))
	{		
		
		with(instance_place(x,y,oBaseball))
		{
			if state == stateToss
			{
				oSFX.baseballcrack = true;
				state = stateFly;
				grv = 0;
				vsp = lengthdir_y (10,other.image_angle);
				dir = other.image_angle;
			}
		}
		hitStop(_hs);
		instance_destroy();
	}
}

stateParry = function()
{
	//hitting an enemy
	if (place_meeting(x,y,pEntity))
	{
		var target = other.id;
		with(instance_place(x,y,pEntity))
		{
			baseDMG = ceil(mean(oMultiWeapon.damage + abs(oNewt.hsp/5),oMultiWeapon.damage*1.5))
			hp -= baseDMG;
			if (!noDMG)
			{
				myDamage.damage += baseDMG;
				myDamage.alpha = 1;
				myDamage.dmgTextScale = 0.75
			}
			flash = 3;	
			hitfrom = other.direction;
		}
		hitStop(2);
		instance_destroy();
	}
	
	//ultrakill parry
	if (place_meeting(x,y,oEnemyShot))
	{	
		hitStop(15);
		oSFX.parry = true;
	
		with(instance_place(x,y,oEnemyShot))
		{
			x = other.x;
			y = other.y;
		
			friendly = true;
			parried = true;
			image_angle = other.image_angle;
			dir = image_angle;
			spd *= 2;
		}
	}
	
	//shrug bat corpse reflect
	if (place_meeting(x,y,oDShrugBat))
	{	
		instance_create_depth(0,0,0,oHstop);
	
		oSFX.parry = true;
	
		with(instance_place(x,y,oDShrugBat))
		{
			grv = 0;
			dir = other.image_angle;
			vsp = -6;
			hsp = lengthdir_x(8 * abs(oNewt.hsp), other.image_angle);
			imgRot = irandom_range(-3, 3);
		}
		instance_destroy();
	}
	
	// shrug bat swoop
	if place_meeting(x,y,oEShrugBat)
	{
		var target = other.id;
		if (target.state = batStates.swoop)
		{	
			instance_create_depth(other.x, other.y, other.depth,oDShrugBat);
			instance_destroy(other);	
		}
	}
	
}

stateSlice = function()
{
}

stateDestroy = function()
{
	//hitting an enemy
	if (place_meeting(x,y,pEntity))
	{
		with(instance_place(x,y,pEntity))
		{
			diedFrom = "overkill";
			
			var target = other.id;
			
			baseDMG = ceil(mean(oMultiWeapon.damage + abs(oNewt.hsp/5),oMultiWeapon.damage*1.5))
			hp -= baseDMG;
			if (!noDMG)
			{
				myDamage.damage += baseDMG;
				myDamage.alpha = 1;
				myDamage.dmgTextScale = 0.75
			}
			flash = 3;	
			hitfrom = other.direction;
		}
		hitStop(other._hs);
		instance_destroy();
	}
	
	//destroy bullet
	if place_meeting(x,y,oEnemyShot)
	{
		with(instance_place(x,y,oEnemyShot)){instance_destroy()};
	};
}


stt[0] = stateSwat;
stt[1] = stateParry;
stt[2] = stateSlice;
stt[3] = stateDestroy;

state = stt[oMultiWeapon.meleeState];

