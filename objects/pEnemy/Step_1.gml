
if screenPause() {exit;};

if hp <= -(maxHP/2){diedFrom = "overkill"}

if (hp <= 0)
{
	global.getSizeKilled = self.size;
	
	switch(diedFrom)
	{
		case "killer7":
		
			hitStop(45);
			//give exp without corpse
			size = global.getSizeKilled;
			multiplier = choose(1,1,1,1,2);
			expGive();
			repeat(multiplier){instance_create_depth(x,y,depth,oSpookyGhost)};
			
			
			//spawn Killer7 particles
			repeat(abs(sprite_width*sprite_height)/4)
			{
				instance_create_depth(x+random_range(-sprite_width/4,sprite_width/4),random_range(y,y-sprite_height),depth-90,oK7DeathPart);
			}
			
			//increase combo
			if (instance_exists(oNewt))
			{
				global.kills++;
				global.killsthisroom++;
				oGame.killtextscale = 1.5;
				oGame.killscombo++;
				oGame.combotimer = oGame.comboreset;
			}
			
			//custom death noise
			oSFX.k7death = true;
			
		break;
		
		case "standard":
			with (instance_create_layer(x,y-2,layer,corpse))
			{
				direction = other.hitfrom;
				hsp = lengthdir_x(3,direction);
				vsp = lengthdir_y(3,direction)-4;
				if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
				image_yscale = other.size;
			}
			
			if hasWeapon
			{
				with (mygun) instance_destroy();
			}
			
			if (instance_exists(oNewt))
			{
				global.kills++;
				global.killsthisroom++;
				oGame.killtextscale = 1.5;
				oGame.killscombo++;
				oGame.combotimer = oGame.comboreset;
			}
	
		break;
		
		case "overkill":

			//give exp without corpse
			size = global.getSizeKilled;
			multiplier = choose(1,1,1,1,2);
			expGive();
			repeat(multiplier){instance_create_depth(x,y,depth,oSpookyGhost)};
			
			//spawn gore
			repeat(12)
			{
				with instance_create_depth(x,random_range(y,y-sprite_height/4),depth-90,oGore)
				{
					image_xscale = global.getSizeKilled;
					image_yscale = global.getSizeKilled;
				}
			}
			
				//spawn gore
			repeat(50)
			{
				with instance_create_depth(x,y-sprite_height/2,depth-90,oBlood)
				{
					image_xscale = global.getSizeKilled;
					image_yscale = global.getSizeKilled;
				}

			}
			
			if hasHead
			repeat(2)
			{
				with instance_create_depth(x,random_range(y,y-sprite_height/4),depth-90,oGore)
				{
					sprite_index = sGoreEye;	
					image_xscale = global.getSizeKilled;
					image_yscale = global.getSizeKilled;
				}
			}
			
			if hasWeapon
			{
				var chance = choose(1,2,3,4);
				if chance = 3
				{
					with instance_create_layer(x,y-(sprite_height/2),layer,oPistAmmoPickup)	{vsp = -5};
				}
				
				with (mygun) instance_destroy();
			}
			
			if (instance_exists(oNewt))
			{
				global.kills++;
				global.killsthisroom++;
				oGame.killtextscale = 1.5;
				oGame.killscombo++;
				oGame.combotimer = oGame.comboreset;
			}
			
			case "headshot":

			//give exp without corpse
			size = global.getSizeKilled;
			multiplier = choose(1,1,1,1,2);
			expGive();
			repeat(multiplier){instance_create_depth(x,y,depth,oSpookyGhost)};
			
			with (instance_create_layer(x,y-2,layer,corpse))
			{
				direction = other.hitfrom;
				hsp = lengthdir_x(3,direction);
				vsp = lengthdir_y(3,direction)-4;
				if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
				image_yscale = other.size;
			}
			
			//spawn gore
			repeat(5)
			{
				with instance_create_depth(x,random_range(y,y-sprite_height/4),depth-90,oGore)
				{
					image_xscale = global.getSizeKilled;
					image_yscale = global.getSizeKilled;
				}
			}
			
				//spawn gore
			repeat(15)
			{
				with instance_create_depth(x,y-sprite_height/2,depth-90,oBlood)
				{
					image_xscale = global.getSizeKilled;
					image_yscale = global.getSizeKilled;
				}

			}
			
			if hasHead
			repeat(2)
			{
				with instance_create_depth(x,bbox_top,depth-90,oGore)
				{
					sprite_index = sGoreEye;	
					image_xscale = global.getSizeKilled;
					image_yscale = global.getSizeKilled;
				}
			}
			
			if hasWeapon
			{
				var chance = choose(1,2,3,4);
				if chance = 3
				{
					with instance_create_layer(x,y-(sprite_height/2),layer,oPistAmmoPickup)	{vsp = -5};
				}
				
				with (mygun) instance_destroy();
			}
			
			if (instance_exists(oNewt))
			{
				global.kills++;
				global.killsthisroom++;
				oGame.killtextscale = 1.5;
				oGame.killscombo++;
				oGame.combotimer = oGame.comboreset;
			}
	
		break;
	}
	instance_destroy();
}