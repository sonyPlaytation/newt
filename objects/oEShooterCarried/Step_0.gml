/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}


if instance_exists(owner)
{
depth = owner.depth+10;
image_xscale = owner.image_xscale;
x = owner.x - sprite_width/6;
y = owner.y +sprite_height - 6;
}

if !instance_exists(owner) 
{
	instance_destroy(mygun);
	if !instance_exists(owner) 
	{
		with instance_create_depth(x,y,depth,oEShooter)
		{
			hp = other.hp;
		
			myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
			with (myDamage)
			{
				owner = other.id		
			}
		}
		instance_destroy();
	}
}

if instance_exists(oNewt) and !inactive
{
	newtCenter = oNewt.y-20;
	selfCenter = y-20;
	
	
	{
		switch (state)
		{
	
			case carriedstates.patrol:
	
				if collision_line(x, selfCenter, oNewt.x, newtCenter, oCollide, 1, 0) {cantShoot = false}else{cantShoot = true};
			
				att = 120; 
				markerTime = 30;
				image_index = 0;

	
			if cantShoot and (point_in_circle(x,selfCenter,oNewt.x, newtCenter,viewRange))
			{
				vsp = -3; 
				state = carriedstates.alert;
				oSFX.whatwasthatnoise = true;
			}
	
			break;
	

	
			case carriedstates.alert:
				
				sprite_index = sEShooterScramble;
				image_speed = 1;
				
				walksp = 0;
		
				if collision_line(x, selfCenter, oNewt.x, newtCenter, oCollide, 1, 0) {cantShoot = false}else{cantShoot = true};
				
				markerTime--;
	
				//vertical collision
		
				if (place_meeting(x,y+vsp,oCollide))
				{
					while (!place_meeting(x,y+sign(vsp),oCollide))
					{
						y += sign(vsp);
					}
					vsp = 0;
					grounded = true;
				}
				
				y += vsp;
				if (oNewt.x < x){image_xscale = -1} else image_xscale = 1;

				if !cantShoot
				{
					
					hsp = image_xscale; 
					patrolTime = patrolReset;  
					sprite_index = sEShooterAir;
					state = carriedstates.patrol;
					
				}
			break;
		}
	}
}