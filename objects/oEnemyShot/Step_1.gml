/// @description Insert description here
// You can write your code in this editor


//screen pause
if screenPause() {exit;};

xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

if !friendly and (place_meeting(x,y,pAlly))
{
	var _hitGuy = instance_place(x,y,pAlly)
	with(instance_place(x,y,_hitGuy))
	{
		playerHit(other.damage,_hitGuy);
	}
	instance_destroy();
}

if friendly 
{
	image_xscale = 3;
	if parried and ((place_meeting(x,y,pEntity)) or (place_meeting(x,y,oCollide)))
	{
		image_xscale = 5;
		with (instance_create_layer(x,y,"Shots",oExplosion)) {friendly = 0;baseDMG = 90*other.damage;sprite = sExplosionPink};
		instance_destroy();
	}
	else if parried = false
	{	
		//screen pause
		if screenPause() {exit;};

		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);

		x += xspd;
		y += yspd;

		if (place_meeting(x,y,pEntity)) 
		{
			dist = point_distance(oNewt.x,oNewt.y-22,x,y);
			var target = (instance_place(x,y,pEntity));
	
			with target
			{
		
				if !inactive
				{
					diedFrom = "reflect";
					//damage calculation
						
					finalDMG = 75
			
					//subtract health
					hp -= finalDMG;
			
					//damage numbers
					if (!noDMG)
					{
						repeat(irandom_range(7,20)) {(instance_create_layer(target.x,target.y, "Player", oBlood))}
						myDamage.damage += finalDMG;
						myDamage.alpha = 1;
						myDamage.dmgTextScale = 0.75
					}		
					flash = 3;
					hitfrom = other.direction;
					if (hitsound != 0)	oSFX.scientistscream = true;
				}
			}
			outline_end();
			instance_destroy();
		}
		if (place_meeting(x+xspd,y+yspd,oCollide))
		{
			instance_destroy();
			outline_end();
		}
	}
}

if (place_meeting(x,y,oCollide)) && (image_index != 0) 
{
	repeat(irandom_range(2,5))
	{
		with instance_create_depth(x,y,depth,oDust)
		{
			size = random_range(0.25,0.65);
		}
	}
	instance_destroy()
};

if (place_meeting(x,y,oVase)) && (image_index != 0) 
{
	with instance_place(x,y,oVase){hp -= 5};
	repeat(irandom_range(2,5))
	{
		with instance_create_depth(x,y,depth,oDust)
		{
			size = random_range(0.25,0.65);
		}
	}
	instance_destroy()
};

