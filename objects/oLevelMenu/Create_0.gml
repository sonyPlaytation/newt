/// @description Insert description here
// You can write your code in this editor

//layer_set_visible("GUI", 0);

menuOptions = 6
gap = 750/menuOptions;

sodaX = 125;
sodaY = 360;
sodaScale = 2;

s = 0;
y = 540

sodaPicked = -1;

menuReady = false

image_alpha = 1;

alphaBG = 1;

done = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

newt_x = (gui_width/2)+gui_width;
newt_y = gui_height;
newtTargetX = 960;


machine_x = 2;
machine_y = gui_height;
machineTargetX = 0;

newt = instance_create_depth(newt_x,540,oLevelMenu.depth-1000,oLevelNewt);

//can[i] = instance_create


newt.depth = -999

//machine = instance_create_layer(machine_x,540,"LevelUp",oLevelMachine);
//machine.depth = -99998

menu_x = (gui_width/2)+gui_width;
menu_y = gui_height - (gui_margin*5);
menu_x_target = gui_width/2;
menu_speed = 25;
menu_font = fCanont;
menu_itemheight = font_get_size(fCanont);
menu_committed = -1;
menu_control = true;

sodasSpawned = false;

menu[2] = 2;
menu[1] = 1;
menu[0] = 0;

menu_items = array_length(menu);

introTimer = 60;

menu_top = menu_y - ((menu_itemheight*1.5) *menu_items);

menu_cursor = 2;

stateIntro = function()
{
	if input_check_pressed("special")
	{ state = stateAbort};
	
	newt_x += (newtTargetX - newt_x) / menu_speed;
	
	var BG = layer_background_get_id("BlueBG")
	layer_background_alpha(BG, alphaBG);

	if !(done == true)
	{
		alphaBG-= 0.02;
	}
	
	while s < menuOptions
	{
		if global.soda[s] = false{
			menu[s] = instance_create_depth(sodaX+(gap*s),sodaY,oLevelMenu.depth-15,oCan);
			with menu[s] 
			{
				image_index = other.s;
				soda = other.s;
			}
		}
		s++;
	}
	
	if introTimer <= 0{state = statePick};
	introTimer--;
	if (oInv.sodas < 1){state = stateOutro}
}

statePick = function()
{
	if input_check_pressed("special")
	{ state = stateAbort};
	
	newt_x += (newtTargetX - newt_x) / menu_speed;
	if (oInv.sodas < 1){state = stateOutro}
}

stateOutro = function()
{
	if input_check_pressed("special")
	{ state = stateAbort};
	
	newt.x = 2;
	newt.sprite_index = sLVLPunch;
	if instance_exists(oCan){instance_destroy(oCan)};

	if oLevelNewt.image_index = 16
	{
		sprite_index = sSodaPunch; 
		screenShake(35,5); 
		//alarm[0] = 80;
	}

	
	if newt.image_index = 30 or newt.image_index = 31
	{
		done = true;
		
		oLevelMenu.image_alpha-= 0.05;
		newt.image_alpha-= 0.05;
	}

	if image_alpha < 0 or mouse_check_button_pressed(mb_left)
	{
		instance_destroy(newt);
		instance_destroy();
		oSoda.image_index = 1;	
		oNewt.hasControl = true;
		oSFX.sodaget = true;
		
		//layer_set_visible("GUI", 1);
		
		oNewt.sodaToss = true;
	}
}

stateAbort = function()
{
	
	audio_play_sound(snPoof,600,false);
	
	repeat(15)
	{
		with instance_create_depth(960/3,540/2,depth,oDust)	
		{
			size = 6;	
			spd = 4;
		}
		
		with instance_create_depth(newt_x-(960/3), 540-(540/3), depth, oDust)	
		{
			size = 6;	
			spd = 4;
		}
	}
	
	oNewt.hasControl = true;
	if instance_exists(oCan){instance_destroy(oCan)};
	instance_destroy(newt);
	instance_destroy();
}

state = stateIntro;

