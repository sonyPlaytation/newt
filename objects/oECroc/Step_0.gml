/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};

if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

if instance_exists(oNewt) and !inactive
{
	newtCenter = oNewt.y-20;
	selfCenter = y-20;
	
	if mouthopen == true{runsprite = sECrocRunB;}else runsprite = sECrocRunA;
	
	if keyboard_check(ord("f")){mouthopen = true} else mouthopen = false;
	
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
	
	//horizontal collision
		if (place_meeting(x+hsp,y,oCollide))
		{
			while (!place_meeting(x+sign(hsp),y,oCollide))
			{
				x = x + sign(hsp)
			}
			hsp = 0;
			vsp = -4;
		}

	x = x + hsp;

	if collision_line(x, selfCenter, oNewt.x, newtCenter, oCollide, 1, 0) {cantShoot = false}else{cantShoot = true};
	
	if collision_circle(x,y,viewRange,oNewt,0,0) {inView = true}else{inView = false};
	
	if collision_circle(x,y,nearRange,oNewt,0,0) {inRange = true}else{inRange = false};

	

	
		switch (state)
		{
	
			case crocstates.patrol:
	
				image_speed = 1;
			
				if image_xscale = 1{mygun.image_angle = 0}else mygun.image_angle = 180;
			
				att = 120; 
				markerTime = 30;
	
				//dont walk off ledges
				if (grounded) && (stayonledges) && (!place_meeting(x+hsp, y+1, oCollide))
				{
						hsp = -hsp;	
						patrolTime = patrolReset;
						image_xscale = -image_xscale;
				}
	
				vsp = vsp + grv;
				
				if hsp != 0 {sprite_index = runsprite};
				
	
				
	
		
			patrolTime--;
	
				if (patrolTime < 0)
				{
					waitTime--
					hsp = 0;
					sprite_index = sECroc;
					if waitTime < 0
					{
						
						waitTime = waitReset;
						patrolTime = patrolReset;
						image_xscale = -image_xscale;
						hsp = image_xscale;
					}
				}
	
			if cantShoot and (point_in_circle(x,selfCenter,oNewt.x, newtCenter,viewRange))
			{
				hsp = 0;
				vsp = -3; 
				state = states.alert;
				oSFX.whatwasthatnoise = true;
			}
	
			break;
	

	
			case crocstates.alert:
		
				
				//horizontal collision
				if (place_meeting(x+hsp,y,oCollide))
				{
					while (!place_meeting(x+sign(hsp),y,oCollide))
					{
						x = x + sign(hsp)
					}
					hsp = 0;
				}
		
				walksp = runsp;
		
				image_speed = 1.5;
		
				if collision_line(x, selfCenter, oNewt.x, newtCenter, oCollide, 1, 0) {cantShoot = false}else{cantShoot = true};
			
				vsp = vsp + grv;
				
				if (markerTime > 0){sprite_index = sECrocWTF}else 
				{
					sprite_index = runsprite; 
					 }
				
				if inView
				{ 
					if hsp !=0 {sprite_index = runsprite}
					
					if !inRange
					{
						mouthopen = false;
					hsp = walksp*image_xscale;
					}else //if inRange is true
					{
						mouthopen = true;
					}
				}
				
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

				//y += vsp;

				if (oNewt.x < x){image_xscale = -1} else image_xscale = 1;
	
				if (!place_meeting(x,y+1,oCollide))
				{
					grounded = false;
					sprite_index = sECrocJump;
					image_speed = 0;
					if (sign(vsp) > 0) image_index = 1; else image_index = 0;
				}
			
				if !cantShoot {att--;};
				
				if (att <= 0)
				{	
					
					hsp = image_xscale; 
					patrolTime = patrolReset;  
					state = states.patrol;
					
				}
			break;
			
			
			
		}
	
}