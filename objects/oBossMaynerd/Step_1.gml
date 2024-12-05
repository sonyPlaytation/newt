/// @description

if hp <= 0
{
	if expCount < 5 {sprite = sMaynerdWhat}
	else 
	{
		sprite = sMaynerdDie;
		x = lerp(x,oRoomMiddle.x,0.025);
		y = lerp(y,oRoomMiddle.y,0.025);
	}
	
	damage = 0;
	expTimer--;
	
	if expCount == 15 and expTimer == 0 //spawn white wipe
	{
		instance_create_depth(x,y-(sprite_height/2),-9999,oWipeWhite);
	}
	
	if instance_exists(oWipeWhite)
	{
		if oWipeWhite.height >= oWipeWhite.target
		{
			myDamage.damage = 9999;
			instance_destroy();	
		}
	}
	
	if expTimer < 0 
	{
		var expX = random_range (x - (sprite_width/2), x + (sprite_width/2));
		var expY = random_range (y,y-sprite_height);
		
		explosion(200, 45, expX, expY,false,1);	
		expCount++;
		
		if expCount > 4 
		{ 
			expReset-= 4; 
			expTimer = max(expReset, 8); 
		} 
		else expTimer = expReset;
	}
}