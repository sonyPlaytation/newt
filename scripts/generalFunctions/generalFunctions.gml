
function controlsSetup()
{
	jumpBufferTime = 6;
	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}

function generalFunctions(){
	
	var _gamepad = gamepad_get_device_count();
	global.gamepadType = gamepad_get_description(_gamepad)
	
////player input
//	key_left = keyboard_check(ord("A")) + gamepad_button_check(4,gp_padl);
//		key_left = clamp(key_left, 0, 1);
	
//	key_right = keyboard_check(ord("D"))+ gamepad_button_check(4,gp_padr);
//		key_right = clamp(key_right, 0, 1);
	
//	key_up = keyboard_check(ord("W"))   + gamepad_button_check(4,gp_padu) + clamp(gamepad_axis_value(4,gp_axislv),-1,0);
//		key_up = clamp(key_up, 0, 1);
	
//	key_down = keyboard_check(ord("S")) + gamepad_button_check(4,gp_padd) + clamp(gamepad_axis_value(4,gp_axislv),0,1);
//		key_down = clamp(key_down, 0, 1);

//	key_stomach = keyboard_check_pressed(ord("E")) + gamepad_button_check_pressed(4,gp_face1);
//		key_stomach = clamp(key_stomach, 0, 1);
	
//	key_spit = keyboard_check_pressed(ord("Q")) + gamepad_button_check_pressed(4,gp_stickl);
//		key_spit = clamp(key_spit, 0, 1);
	
//	key_inspect = keyboard_check(ord("F")) + gamepad_button_check_pressed(4,gp_select);
//		key_inspect = clamp(key_inspect, 0, 1);
	
//	key_autoRun = keyboard_check_pressed(ord("Z")) + mouse_check_button_pressed(4);
//		key_autoRun = clamp(key_autoRun, 0, 1);
	
//	key_run = keyboard_check(vk_shift) + mouse_check_button(5);
//		key_run = clamp(key_run, 0, 1);
		
//	//scroll wheel weapon select
//	key_scrup = mouse_wheel_up();
//	key_scrown = mouse_wheel_down() + gamepad_button_check_pressed(4,gp_face4);
//		key_scrown = clamp(key_scrown, 0, 1);

//	//jump pressed
//	key_jump = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(4,gp_shoulderl);
//		key_jump = clamp(key_jump, 0, 1);
	
//	//jump held
//	key_jump_held = keyboard_check(vk_space) + gamepad_button_check(4,gp_shoulderl);
//		key_jump_held = clamp(key_jump_held, 0, 1);
	
//	//altFire
//	mouseRight = mouse_check_button_pressed(mb_right) + gamepad_button_check_pressed(4,gp_shoulderrb);
//		mouseRight = clamp(mouseRight, 0, 1);
	
	//jump key buffer
	if input_check_pressed("jump")
	{
		jumpKeyBufferTimer = jumpBufferTime;
	}
	if jumpKeyBufferTimer > 0
	{
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	} else{
		jumpKeyBuffered = 0;	
	}
	
	//analogue sticks
	//Left stick Axes
	global.xAxisLeft = 0; 
	global.yAxisLeft = 0;
	


}