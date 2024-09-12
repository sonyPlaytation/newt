/// @description Insert description here
// You can write your code in this editor

soda = irandom(array_length(global.soda)-1);
image_index = soda;

alpha = 0;

desc[0] = "Double Jump";
desc[1] = "Homing Shots";
desc[2] = "Blood Heals";
desc[3] = "+2 Max HP";

function sodaGet(soda)
{
	switch (soda)
	{
		case 0: //double jumps
			global.soda[0] = true;
		break;
		
		case 1: //homing
			global.soda[1] = true;
		break;
		
		case 2: //blood
			global.soda[2] = true;
		break;
		
		case 3: //two health ups
			global.soda[3] = true;
			playerHealthUp(true);
			playerHealthUp(true);
		break;
		

	}
	
}