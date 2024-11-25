
///@args targCorpse
///@args [range]
///@args [overRide]
///@args [overRideArr]

function lineOfSight(){
	
	if argument0 == true
	{var _targ = pEntity} else var _targ = pEnemy;		// target corpses yes or no
	
	if (argument1 == undefined) or (argument1 == -1)
	{var _viewRange = 999}else var _viewRange = argument1;		// sight range
	
	if argument2 != undefined
	{var _targ = argument2}								// only look for this specific instance
	
	//if (argument3 != undefined) or (argument1 != -1)	
	//{var _arr = argument3; var noArr = true}			// only look for anything in a passed-in array
	//else var noArr = false
	
	var _selfCenter = other.y - (sprite_get_height(other.image_index)/2);
	var _target = ds_priority_create()
	
	switch other.friendly
	{
		
		case 1: //allys shooting enemies
		if instance_exists(_targ)
		{
			for (var i = 0; i < instance_number(_targ); ++i;)
			{
				var _currGoon = instance_find(_targ,i);	
				//if noArr or array_contains(argument3, _currGoon)
				//{
					if collision_circle(other.x,_selfCenter,_viewRange,_currGoon,0,0)
					{
						if  !collision_line(other.x,_selfCenter,_currGoon.x,_currGoon.y-20,oCollide,0,0)
						and !collision_line(other.x,_selfCenter,_currGoon.x,_currGoon.y-20,pPhysProp,0,0)
						{
							var _dist = (point_distance(x,_selfCenter,_currGoon.x,_currGoon.y-20));
							ds_priority_add(_target,_currGoon,_dist);
						}
					}
				//}
			}
			target = ds_priority_find_min(_target);
		}
		break;
			
		case 0: //anything attacking anything else
		if instance_exists(pEvery)
		{
			for (var i = 0; i < instance_number(pEvery); ++i;)
			{ 
				var _currGoon = instance_find(pEvery,i);
				if array_contains(argument3, _currGoon)
				{
					if collision_circle(other.x,_selfCenter,_viewRange,_currGoon,0,0)
					{
						if !collision_line(other.x,_selfCenter,_currGoon.x,_currGoon.y-20,oCollide,0,0) and (_currGoon.id != self.id)
						{
							var _dist = (point_distance(x,_selfCenter,_currGoon.x,_currGoon.y-20));
							ds_priority_add(_target,_currGoon,_dist);
						}
					}
				}
			}
			target = ds_priority_find_min(_target);
		}
		break;

		case -1: //enemies shooting allys

		if instance_exists(pAlly)
		{
			for (var i = 0; i < instance_number(pAlly); ++i;)
			{
				var _currGoon = instance_find(pAlly,i);
				var _targCenter = _currGoon.y - (_currGoon.sprite_height/2);
				if collision_circle(x,_selfCenter,_viewRange,_currGoon,0,0)
				{
					if !collision_line(x,_selfCenter,_currGoon.x,_targCenter,oCollide,0,0)
					and !collision_line(x,_selfCenter,_currGoon.x,_targCenter,pPhysProp,0,0)
					{
						var _dist = (point_distance(x,_selfCenter,_currGoon.x,_targCenter));
						ds_priority_add(_target,_currGoon,_dist);
					}
				}
			}
			target = ds_priority_find_min(_target);
		}
		else target = noone;
		break;
	}
	if ds_exists(_target, ds_type_priority){ ds_priority_destroy(_target)};
	return target; 
}