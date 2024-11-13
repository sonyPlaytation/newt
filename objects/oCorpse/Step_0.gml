


//code for in the belly
if !inBelly
{
	mask_index = sprite_index;
	if fresh <=0
	{
		image_yscale = lerp(image_yscale,0,0.05);
		if image_yscale < 0.05
		{
			repeat(8*size) {instance_create_depth(x,y,depth-15,oDust)};
			
			var _dropRNG = random(99);
			if drop != noone and _dropRNG <= dropChance
			{
				instance_create_depth(x,y,depth-15,choose(oAmmoPickup,oHealthPickup))
			};
			
			instance_destroy();
		}
	}	
	alpha = 1;
}
else
{
	alpha = 0;
	x = 0;
	y = 0;

	if fresh <=0
	{
		oInv.full = 0;
		oInv.inBelly = noone;
		audio_play_sound(snFunnyFart,1000,false);
		with (oNewt){squishNewt(1.25,0.75); repeat(3) instance_create_depth(x,y,depth-15,oDust)};
		
		funcDigest(effect);
		instance_destroy();	
	}	
}

if abs(oNewt.hsp) > 5 {decX = 2} else decX = 0;
if oNewt.vsp < 0 {decY = 2} else decY = 0;
decay = 1 + decX + decY;

fresh -= decay;

//gibs
if hp <=0 and !inBelly
{
	instance_destroy();
	if effect == "explode" {with instance_create_layer(x,y,"Shots",oExplosion){friendly = 0}}else

	repeat(12) //spawn gore
	{
		with instance_create_depth(x,random_range(y,y-sprite_height/4),depth-90,oGore)
		{
			image_xscale = other.size;
			image_yscale = other.size;
		}
	}
	repeat(50)
	{
		with instance_create_depth(x,y-sprite_height/2,depth-90,oBlood)
		{
			image_xscale = other.size;
			image_yscale = other.size;
		}
	}	
}

if charred and alpha > 0 //if died by fire
{
	effect = "hurt";
	var _x = random_range(bbox_left-10,bbox_right+10);
	var _y = random_range(bbox_bottom+10,bbox_top-10);
	instance_create_depth(_x,_y,depth-10,oFlameParticle);
}

//step event codes
switch (corpse)
{
	case "generic":
		if (done < 30)
		{
			if hsp == 0{done++}else{done = 0};
			if vsp != 0{image_index = 0};
			
			var imgRot = 1;
			rot -= imgRot*image_yscale;
			
			vsp = vsp + grv;

			//horizontal collision
			if (place_meeting(x+hsp,y,oCollide))
			{
				while (!place_meeting(x+sign(hsp),y,oCollide))
				{
					x += sign(hsp)
				}
				hsp = -hsp/4;
			}
			x += hsp;

			//vertical collision
			if (place_meeting(x,y+vsp,oCollide))
			{
				if (vsp > 0) 
				{
					hsp *= 0.85;
					image_index = 1;
					rot = 0;
				}
				while (!place_meeting(x,y+sign(vsp),oCollide))
				{
					y += sign(vsp)
				}
				if vsp > 1{oSFX.goremain = true};
				vsp = 0;
			}
			y += vsp;
		}
	break;
	
	case "bat":
		if !inBelly
		{
			
			var imgRot = 2;
			rot += imgRot;
			if vsp > 0 {oSFX.planefall = true};

			vsp = vsp + grv;
			if (grv < 0.2) {grv += 0.02};

			//horizontal collision
			if (place_meeting(x+hsp,y,oCollide))
			{
				while (!place_meeting(x+sign(hsp),y,oCollide))
				{
					x += sign(hsp)
				}
				hsp = -hsp/2;
			}
			hsp = min(15, hsp*0.99);	
			x += hsp;

			//vertical collision
			if (place_meeting(x,y+vsp,oCollide)) 
			{
				while (!place_meeting(x,y+sign(vsp),oCollide)){y += sign(vsp)};
				with (instance_create_layer(x,y,"Shots",oExplosion)) {friendly = 0;baseDMG = 200};
				instance_destroy();
			}

			if (place_meeting(x,y+vsp,pEntity)) 
			{
				if !place_meeting(x,y+vsp,oEShooter)
				{
					while (!place_meeting(x,y+sign(vsp),oCollide)){y += sign(vsp)};
					with (instance_create_layer(x,y,"Shots",oExplosion)) {friendly = 0;baseDMG = 200};
					instance_destroy();
				}
			}
			y += vsp;
		}
		else
		{baseDMG = 150};
	
	break;
	
	case "killer7":
		if timer < 0 and !inBelly
		{
			//spawn Killer7 particles
			repeat(abs(sprite_width*sprite_height)/4)
			{
				instance_create_depth(x+random_range(-sprite_width/4,sprite_width/4),random_range(y,y-sprite_height),depth-90,oK7DeathPart);
			}
			//custom death noise
			oSFX.k7death = true;
			instance_destroy();
		}
		timer--
	break;
	
}

if (abs(hsp) > 0) {image_xscale = sign(hsp)};