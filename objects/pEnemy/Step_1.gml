
//spawnCorpse = function(corpseOverride)
//{
//	if (argument0 != undefined){var _corpse = corpseOverride} else var _corpse = corpse;
	
//	with (instance_create_layer(x,y-2,layer,oCorpse))
//	{	
//		corpse = other._corpse;
//		big = other.big;
//		drop = other.drop;
//		dropChance = other.dropChance;
//	}		
//}

if screenPause() {exit;};

if !layer_exists("Enemy"){layer_create(layer_get_depth("Player")+1,"Enemy")};

if hp <= -(maxHP/2){diedFrom = "overkill"}

if (hp <= 0)
{
	global.getSizeKilled = size;
	global.corpseSprite = cSprite;
	
	switch(diedFrom)
	{
		case "killer7":
			
			with (instance_create_layer(x,y-2,"Shots",oCorpse))
			{	
				corpse = "killer7";
				sprite_index = other.sprite_index;
				image_index = other.image_index;
				big = other.big;
			};
			
		break;
		
		case "standard":
			with (instance_create_layer(x,y-2,"Enemy",oCorpse))
			{	
				corpse = other.corpse
				big = other.big;
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
		
		case "fire":
			with (instance_create_layer(x,y-2,"Enemy",oCorpse))
			{	
				corpse = other.corpse
				big = other.big;
				charred = true;
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
		
		case "fireOverkill":
			with (instance_create_layer(x,y-2,"Enemy",oCorpse))
			{	
				corpse = other.corpse
				big = other.big;
				charred = true;
			}
			
			expGive();
			
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
					with instance_create_layer(x,y-(sprite_height/2),layer,oAmmoPickup)	{vsp = -5};
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
					with instance_create_layer(x,y-(sprite_height/2),layer,oAmmoPickup)	{vsp = -5};
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
		
		case "headshot":

			//give exp without corpse
			size = global.getSizeKilled;
			multiplier = choose(1,1,1,1,2);
			expGive();
			repeat(multiplier){instance_create_depth(x,y,depth,oSpookyGhost)};
			
			with (instance_create_layer(x,y-2,layer,oCorpse))
			{
				corpse = other.corpse
				big = other.big;
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
					with instance_create_layer(x,y-(sprite_height/2),layer,oAmmoPickup)	{vsp = -5};
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
