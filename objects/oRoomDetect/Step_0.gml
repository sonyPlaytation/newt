/// @description Insert description here
// You can write your code in this editor

if !midOverride
{
	if !rewardGranted and !instance_exists(myMiddle)
	{
		myMiddle = instance_create_depth(x,y,depth,oRoomMiddle)
		with (myMiddle)
		{
			owner = other.id;
		}
	}
}

roomEnemies = place_meeting(x,y,pEnemy);

if (instance_exists(oNewt))
{
	if place_meeting(x,y,oNewt)
	{	
		roomActive = true
		inRoom = true; 
		if global.gameState == 0 {oCamera.follow = instance_nearest(oNewt.x,oNewt.y,oRoomMiddle)}
		else oCamera.follow = oNewt;
	}else inRoom = false;

	//check if not in active room
	if (!inRoom) and (roomActive == true) 
	{
		inRoom = true;
		with (oNewt)
		{
			hsp = 0;
			vsp = 0;
			x = instance_nearest(x,y,oFallbackWarp).x;
			y = instance_nearest(x,y,oFallbackWarp).y;
		}
	}

	//check clear conditions
	if (inRoom == true) and (roomEnemies > 0)
	{
		roomActive = true;
	}

	if (inRoom == true) and (roomEnemies <= 0)
	{
		roomCleared = true;
		roomActive = false;
	}
}

if bossRoom
{
	if (song != -1)
	{
		if  (!roomCleared) and !pEnemy.inactive
		{
			with (oMusicManager) {set_song_ingame(other.song)};
		}
		else if roomCleared {with (oMusicManager) {set_song_ingame(mAddiction)}};
	}	
}

