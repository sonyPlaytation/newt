/// @description Insert description here
// You can write your code in this editor

if (friendly = -1 ) or (friendly = 0 ) and point_in_circle(oNewt.x,oNewt.y,x,y, radius) and !collision_line(x, y, oNewt.x, oNewt.y-22, oCollide, 1, 0) and (image_index == 0) { playerHit(1,oNewt)};

pushDistH = min(point_distance(oNewt.x,global.newtCenter,x,y),15);
pushDistV = min(point_distance(oNewt.x,global.newtCenter,x,y)/6,15);
pushAng = point_direction(oNewt.x,global.newtCenter,x,y);

with(oNewt)
	{
		if !onGround and (other.image_index == 0)
		{
			hsp -= lengthdir_x(other.pushDistH,other.pushAng);
			vsp -= lengthdir_y(other.pushDistV,other.pushAng);
		}
	}
