/// @description Insert description here
// You can write your code in this editor

global.inputdevice = input_profile_get();

//CHEATS
if(keyboard_check_pressed(vk_anykey)) and instance_exists(oNewt) // only do the check when a key is pressed
{
	//IDDQD
	if(ds_list_find_value(code1Seq, code1Index) == keyboard_lastkey) //character checking
	{code1Index++} //if so move to the next index
	else
	{code1Index = 0};
         
	//if we have done the entire code
	if(ds_list_size(code1Seq) == code1Index)//trigger cheat code
	{
		code1Index = 0;
		if !oNewt.godmode 
		{
			systemMsg("invulnerability",1.5,1);
		};
		oNewt.godmode = !oNewt.godmode;
	}

	//IDKFA
	if(ds_list_find_value(code2Seq, code2Index) == keyboard_lastkey)
	{code2Index++}
	else
	{code2Index = 0};
         
	if(ds_list_size(code2Seq) == code2Index)
	{
		code2Index = 0;
		systemMsg("health\nammo\nsodas",1.5,1);
				
		//for (var i = array_length(global.soda)-1; i > -1; i--) 
		//{
		//	if global.soda[i] = false
		//	{sodaGet(i)};	
		//}
		
		oInv.hpMax = 12;
		oInv.hp = 12;
		repeat(256){getAmmo()};
	}
	
		//IDSODA
	if(ds_list_find_value(code3Seq, code3Index) == keyboard_lastkey)
	{code3Index++}
	else
	{code3Index = 0};
         
	if(ds_list_size(code3Seq) == code3Index)
	{
		code3Index = 0;
		systemMsg("pocket change",1.5,1);
		oInv.sodas = 10;
	}
}