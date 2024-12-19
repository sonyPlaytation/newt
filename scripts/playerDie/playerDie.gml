function playerDie(){

	instance_change(oDead,true);

	vsp -= lengthdir_y(3,global.hitfrom)+4;

	global.killsthisroom = 0;
	oGame.combotimer = 0;
}