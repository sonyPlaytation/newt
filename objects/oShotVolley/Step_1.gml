

//screen pause
if screenPause() {exit;};

xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

if crit {draw_set_color(c_red)};

if (place_meeting(x,y,pEntity)) 
{
	dist = point_distance(xstart,ystart,x,y);
	var target = (instance_place(x,y,pEntity));
	
	
	with target
	{
		
		if !inactive
		{
			diedFrom = "standard";
			
			//damage calculation
			if (other.crit == true) {finalDMG = other.baseDMG * 3}
			else finalDMG = standardFalloff(other.dist,other.baseDMG);
			
			//subtract health
			hp -= finalDMG;
			
			//damage numbers
			if (!noDMG)
			{
				repeat(irandom_range(7,20)) {(instance_create_layer(target.x,target.y-(sprite_height/2), "Player", oBlood))}
				myDamage.damage += finalDMG;
				myDamage.alpha = 1;
				myDamage.dmgTextScale = 0.75
			}
		
			//if rolled a crit
			if (other.crit == true)
			{
				myDamage.dmgTextScale = 1;
				
				with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
				{
					owner = target.id	
				}
			} else {global.critTotalDMG += finalDMG}
			
			flash = 3;
			hitfrom = other.direction;			
		}
	}
	
	outline_end();
	instance_destroy();
}


if bounce != 0 and (collision_circle(x,y,spd,oCollide,1,0)) 
{
	if abs(yspd) > abs(xspd) {dir = -dir}else dir = 180-dir;
	
	bounce--;
	image_angle = dir;
}
else if (place_meeting(x,y,oCollide)) && (image_index != 0) 
{
	global.hasCrit = false;
	instance_destroy();
	outline_end();
}

