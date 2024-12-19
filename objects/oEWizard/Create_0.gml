
// Inherit the parent event
event_inherited();

corpse = "wizard";
cSprite = sEWizardDie;

groundTime = 30;

selfCenter = 0;

shootReset = 270;
shootTimer = 60;

teleReset = 60;
teleTimer = teleReset

target[0] = noone;
targSwap = noone;

vsp = 0;
grv = 0.3;

oldX = x;
oldY = y;
newX = noone;
newY = noone;

teleUsed = false;

stateIdle = function()
{
	if canShoot{state = stateEngage}
}

stateEngage = function()
{
	if !canShoot{state = stateIdle}
	
	shootTimer--;
	
	if (oNewt.x > x) {image_xscale = 1} else image_xscale = -1
	
	if shootTimer = 0
	{
		myShot = instance_create_layer(x,selfCenter,"Shots",oEWizardFireball);
		with myShot
		{
			owner = other.id;
			dir = point_direction(xstart,ystart,oNewt.x,global.newtCenter)
			spd = 3;
			damage = 1;
			image_angle = dir;
		}
		shootTimer = shootReset
	}
	
	if hp < (maxHP*0.75) and !teleUsed
	{
		oldX = x;
		oldY = y;
		state = stateTele
	}
}

stateTele = function()
{
	var _target = ds_priority_create()

	if instance_exists(myRoom)
	{
		for (var i = 0; i < instance_number(pEntity); ++i;)
		{
			var _currGoon = instance_find(pEntity,i);
			if (_currGoon != oEWizard)
			{
				var _goonRoom = _currGoon.myRoom
				if _goonRoom == self.myRoom
				{
					var _dist = point_distance(x,y,_currGoon.x,_currGoon.y);
					ds_priority_add(_target,_currGoon,_dist);
				}
			}
		}
		targSwap = ds_priority_find_max(_target);
		
		newX = targSwap.x;
		newY = targSwap.y;
		
		if object_is_ancestor(targSwap.object_index,pPhysProp)
		{
			with (targSwap)
			{
				phy_active = true;
				idleTimer = 0;
				phy_position_x = other.oldX;
				phy_position_y = other.oldY-30;
			}
		}
		else
		{
			with (targSwap)
			{
				x = other.oldX;
				y = other.oldY-30;
			}
		}
		
		repeat (20) with instance_create_depth(newX,newY-20,depth-20,oDust){size = 2; spd = 4;}
		repeat (20) with instance_create_depth(oldX,oldY-20,depth-20,oDust){size = 2; spd = 4;}
		
		x = newX;
		y = newY;
		teleUsed = true;
		ds_priority_destroy(_target);
		shootTimer = 30;
		vsp -= 3;
		state = stateIdle;
	}
	else
	{
		targSwap = instance_furthest(x,y,pEvery)
		
		if image_xscale < 0.1
		{
			newX = targSwap.x;
			newY = targSwap.y
	
			if object_is_ancestor(targSwap.object_index,pPhysProp)
			{
				with (targSwap)
				{
					phy_active = true;
					idleTimer = 0;
					phy_position_x = other.oldX;
					phy_position_y = other.oldY-30;
				}
			}
			else
			{
				with (targSwap)
				{
					x = other.oldX;
					y = other.oldY-30;
				}
			}
			repeat (20) with instance_create_depth(newX,newY-20,depth-20,oDust){size = 2; spd = 4;}
			repeat (20) with instance_create_depth(oldX,oldY-20,depth-20,oDust){size = 2; spd = 4;}
		
			x = newX;
			y = newY;
			draw_line(oldX,oldY,newX,newY);
			teleUsed = true;
			shootTimer = 30;
			vsp -= 3;
			state = stateIdle;
		}
	}
}

state = stateIdle






























