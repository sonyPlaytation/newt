/// @description Insert description here
// You can write your code in this editor


if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
	
}else {myRoom = noone;}


if(hasWeapon)
{
	mygun = instance_create_layer(x,y,"Weapon",oWandEnemy);
	with (mygun)
	{
		owner = other.id;
	}
}
else mygun = noone;





