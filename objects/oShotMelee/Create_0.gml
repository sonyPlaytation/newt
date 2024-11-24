/// @description Insert description here
// You can write your code in this editor

hitTarget = function()
{
	//hitting an enemy
	if (place_meeting(x,y,pEntity))
	{
		var target = instance_place(x,y,pEntity)
		
		if object_is_ancestor(target.object_index,pPhysProp) and instance_exists(oNewt)
		{					
			switch (state)
			{
				case stateParry:
				with (target)
				{
					idleTimer = 0;
					phy_active = true;
					var physX = lengthdir_x(100,other.image_angle)*(1000-(target.phy_mass));
					var physY = lengthdir_y(100,other.image_angle)*(1000-(target.phy_mass));
				
					physics_apply_impulse(x,y,physX,physY);
				
					diedFrom = "standard";
			
					var _dmg = oWeapon.damage/2;
					hp -= _dmg;
			
					global.critTotalDMG += _dmg;
			
					flash = 3;			
					hitfrom = other.direction;	
				};
				break;
				
				default:
				with (target)
				{
					idleTimer = 0;
					phy_active = true;
					var physX = lengthdir_x(2,other.image_angle)*(1000-(target.phy_mass));
					var physY = lengthdir_y(2,other.image_angle)*(1000-(target.phy_mass));
				
					physics_apply_impulse(x,y,physX,physY);
				
					diedFrom = "standard";
			
					var _dmg = oWeapon.damage/2;
					hp -= _dmg;
			
					global.critTotalDMG += _dmg;
			
					flash = 3;			
					hitfrom = other.direction;	
				};
				break;
			}
		}
		else
		{
			with(target)
			{
				diedFrom = "standard";
			
				if other.crit
				{
					var _dmg = oWeapon.damage*3;
				}
				else
				{
					var _dmg = ceil(mean(oWeapon.damage + abs(oNewt.hsp/5),oWeapon.damage*1.5))
				}
				var _finaldmg = _dmg*oInv.dmgMod;
			
				hp -= _finaldmg
			
				if hp <=0
				{
					oNewt.dashCount++;
				}
			
				if (!noDMG)
				{
					myDamage.damage += _finaldmg;
					myDamage.alpha = 1;
					myDamage.dmgTextScale = 0.75
				}
			
				if (other.crit) and (!noDMG)
				{
					myDamage.dmgTextScale = 1;
					with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
					{
						owner = target.id	
					}
				} else {global.critTotalDMG += _finaldmg}
			
				flash = 3;			
				hitfrom = other.direction;
			
			}
			hitStop(_hs);
		}
		instance_destroy();
	}
}

swatTrail = function()
{
	with instance_create_depth(x,y,depth,oSwingTrail)
	{
		owner = other.id;
	}
}

ammoBack = function(type,amount)
{
	//destroy bullet
	if place_meeting(x,y,oEnemyShot)
	{
		var _shot = instance_place(x,y,oEnemyShot)
		with(_shot)
		{
			with instance_create_depth(x,y,depth,oCritHeader){image_index = 2};
			instance_destroy();
		};
		oWeapon.ammo[type] += amount;
	};		
}

alarm[0] = 10;

hit = false;

sprW = 0;
sprH = 60;

image_xscale = sprW/2;
image_yscale = sprH/2;

_hs = max (0, oWeapon.cooldown/4)
click = 0;

stateSwat = function()
{
	//projectile Swat
	if (place_meeting(x,y,oEnemyShot))
	{	
		var _target = (instance_place(x,y,oEnemyShot));
		if _target.friendly != 1
		{
			if oWeapon.sprite == sSandman {oSFX.baseballcrack = true} else audio_play_sound(snBatParry,500,false);
			with _target
			{
				spd *= 1.85;
				friendly = true;
				parried = false;
				image_angle = point_direction(x,y,mouse_x,mouse_y);
				dir = point_direction(x,y,mouse_x,mouse_y);
			}
			hitStop(_hs);
		}
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
	
	hitTarget();
}

stateParry = function()
{
	//ultrakill parry
	if (place_meeting(x,y,oEnemyShot))
	{	
		oSFX.parry = true;
		with(instance_place(x,y,oEnemyShot))
		{
			x = other.x;
			y = other.y;
		
			friendly = true;
			parried = true;
			image_angle = point_direction(x,y,mouse_x,mouse_y);
			dir = point_direction(x,y,mouse_x,mouse_y);
			spd = 23;
		}
		hitStop(15);
	}
	
	//shrug bat corpse reflect
	if (place_meeting(x,y,oCorpse))
	{	
		var _corpse = instance_place(x,y,oCorpse);
		if _corpse.corpse == "bat"
		{	
			oSFX.parry = true;
			global.corpseSprite = sEShrugBatDie;
			global.getSizeKilled = 1;
			with instance_create_depth(x, y-20, _corpse.depth,oCorpse)
			{
				inactive = false;
				diedFrom = noone;
				corpse = "batparry";
				cSprite = sEShrugBatDie;
				big = false;
			}
			instance_destroy(_corpse);	
		}
	}
	
	// shrug bat swoop
	if place_meeting(x,y,oEShrugBat)
	{
		var _target = instance_place(x,y,oEShrugBat)
		if (_target.state == _target.stateSwoop)
		{	
			oSFX.parry = true;
			global.corpseSprite = sEShrugBatDie;
			global.getSizeKilled = 1;
			with instance_create_depth(x, y-20, _target.depth,oCorpse)
			{
				inactive = false;
				diedFrom = noone;
				corpse = "batparry";
				cSprite = sEShrugBatDie;
				big = false;
			}
			instance_destroy(_target);	
		}
	}
	
	hitTarget();
}

stateSlice = function()
{
	var _ammo = irandom(5);
	ammoBack(_ammo,5);
	
	hitTarget();
}

stateDestroy = function()
{
	//destroy bullet
	if place_meeting(x,y,oEnemyShot)
	{
		with(instance_place(x,y,oEnemyShot)){instance_destroy()};
	};
	
	hitTarget();
	
}

stateWrench = function()
{
	if click = 0 //left click
	{
		//sentry heal
		if place_meeting(x,y,oSentryHead)
		{
			var _sentry = instance_place(x,y,oSentryHead)
			if oWeapon.ammo[0] >= 10 and ((_sentry.hp < _sentry.maxHP) or (_sentry.ammo < _sentry.maxAmmo))
			{
				audio_play_sound(choose(snWrenchBuild1,snWrenchBuild2),600,false);
				if (_sentry.hp < _sentry.maxHP) and oWeapon.ammo[0] >= 10
				{
					with _sentry
					{
						hp = min(maxHP, hp+2);
					}
					oWeapon.ammo[0] -= 10;
				}
				
				if (_sentry.ammo < _sentry.maxAmmo) and oWeapon.ammo[0] >= 10
				{
					with _sentry
					{
						ammo = min(maxAmmo, ammo+5);
					}
					oWeapon.ammo[0] -= 10;	
				}
			}
			else
			{
				audio_play_sound(snWrenchFail,450,false);
			}
			instance_destroy();
		}
		
		ammoBack(0,10);
		
		hitTarget();
		
		
	}
	else if click = 1 //right click
	{
		if place_meeting(x,y,oSentryHead)
		{
			var _sentry = instance_place(x,y,oSentryHead)
			oWeapon.ammo[0] += 100;
			with instance_place(x,y,_sentry)
			{
				instance_destroy();
			}
			instance_destroy();
		}
	}
}

stateWeak = function()
{
	hitTarget();
}

stt[0] = stateSwat;
stt[1] = stateParry;
stt[2] = stateSlice;
stt[3] = stateDestroy;
stt[4] = stateWrench;
stt[5] = stateWeak;

swatTrail();
state = stt[oWeapon.meleeState];

