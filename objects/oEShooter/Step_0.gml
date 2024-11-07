/// @description Insert description here
// You can write your code in this editor

//screen pause
if screenPause() {exit;};
selfCenter = y-20;

if instance_exists(myRoom)
{
	if myRoom.roomActive {inactive = false} else inactive = true;
}

if instance_exists(pAlly) and !inactive
{


	state();	
	
	//switch (state)
	//{
	//	case states.patrol:
		
	//	lineOfSight(false);
		
	//	if instance_exists(target)
	//	{
	//		vsp = -3; 
	//		state = states.alert;
	//		oSFX.whatwasthatnoise = true;
	//	}
			
	//	att = 120; 
	//	markerTime = 30;
	
	//	//dont walk off ledges
	//	if (grounded) && (stayonledges) && (!place_meeting(x+hsp, y+1, oCollide))
	//	{
	//			hsp = -hsp;	
	//			patrolTime = patrolReset;
	//			image_xscale = -image_xscale;
	//	}
	
	//	vsp = vsp + grv;
				
	//	sprite_index = sEShooterWalk;
	//	image_speed = 1;
	
	//	//vertical collision
		
	//	if (place_meeting(x,y+vsp,oCollide))
	//	{
	//		while (!place_meeting(x,y+sign(vsp),oCollide))
	//		{
	//			y += sign(vsp);
	//		}
	//		vsp = 0;
	//		grounded = true;
	//	}
	//	y += vsp;
	
	//	//horizontal collision
	//	if (place_meeting(x+hsp,y,oCollide))
	//	{
	//		while (!place_meeting(x+sign(hsp),y,oCollide))
	//		{
	//			x = x + sign(hsp)
	//		}
	//		hsp = -hsp;
	//		patrolTime = patrolReset;
	//		image_xscale = -image_xscale;
	//	}
	//	x = x + hsp;
	
	//	patrolTime--;
	//	if (patrolTime == 0)
	//	{
	//		patrolTime = patrolReset;
	//		hsp = -hsp;
	//		image_xscale = -image_xscale;
	//	}
	
	
	
	//	break;
	

	
	//	case states.alert:
		
	//		walksp = 0;
		
	//		if collision_line(x, selfCenter, oNewt.x, global.newtCenter, oCollide, 1, 0) {cantShoot = false}else{cantShoot = true};
	//		vsp = vsp + grv;
	//		if (markerTime > 0){image_speed = 0; sprite_index = sEShooterWTF}else{image_speed = 1; sprite_index = sEShooter};
	//		markerTime--;
	
	//		//vertical collision
		
	//		if (place_meeting(x,y+vsp,oCollide))
	//		{
	//			while (!place_meeting(x,y+sign(vsp),oCollide))
	//			{
	//				y += sign(vsp);
	//			}
	//			vsp = 0;
	//			grounded = true;
	//		}
				
	//		y += vsp;
	//		if (oNewt.x < x){image_xscale = -1} else image_xscale = 1;
	//		if !cantShoot {att--;};
	//		if (att <= 0)
	//		{	
	//			mygun.countdown = irandom_range(30,60);
	//			hsp = image_xscale; 
	//			patrolTime = patrolReset;  
	//			state = states.patrol;
	//		}
	//	break;
	//}
}
