/// @description Insert description here
// You can write your code in this editor

mainRoom = rTest3;

if global.lvlFloor == 0 //Tutorial Start
{
	room_goto(rTutorialNew1);
}
else if global.lvlFloor == 444 //Whats New
{
	room_goto(rTutorialNew6);
}
else //Main Game
{
	room_goto(rTest4);
}








