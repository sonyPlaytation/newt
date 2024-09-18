// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
			//movement and interaction
            up:			input_binding_key("W"),
            down:		input_binding_key("S"),
            left:		input_binding_key("A"),
            right:		input_binding_key("D"),
			jump:		input_binding_key(vk_space),
			interact:	input_binding_key("E"),
            special:	input_binding_key("Q"),
			dash:		[input_binding_key(vk_shift),input_binding_mouse_button(mb_side2)],
            
			//menus
            accept:	   [input_binding_key(vk_space),input_binding_key("E")],
            cancel:		input_binding_key(vk_backspace),

			//weapon menu
			inspect:	input_binding_key("F"),
			weapon1:	input_binding_key("1"),
			weapon2:	input_binding_key("2"),
			weapon3:	input_binding_key("3"),
            
            //weapons
            nextweap:	input_binding_mouse_wheel_down(),
			prevweap:	input_binding_mouse_wheel_up(),
			shoot:		input_binding_mouse_button(mb_left),
			altfire:	input_binding_mouse_button(mb_right),
			
			//misc
            pause:		input_binding_key(vk_tab),
			runtoggle:	input_binding_key(vk_shift),
        },
        
        gamepad:
        {
            up:			[input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
            down:		[input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
            left:		[input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
            right:		[input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
			jump:		 input_binding_gamepad_button(gp_shoulderl),
            interact:    input_binding_gamepad_button(gp_face1),
            special:	 input_binding_gamepad_button(gp_face2),
			
			accept:		input_binding_gamepad_button(gp_face1),
            cancel:		input_binding_gamepad_button(gp_face2),
            
            aim_up:		input_binding_gamepad_axis(gp_axisrv, true),
            aim_down:	input_binding_gamepad_axis(gp_axisrv, false),
            aim_left:	input_binding_gamepad_axis(gp_axisrh, true),
            aim_right:	input_binding_gamepad_axis(gp_axisrh, false),
			
			inspect:	input_binding_gamepad_button(gp_select),
			
			nextweap:	input_binding_gamepad_button(gp_face3),
			prevweap:	input_binding_gamepad_button(gp_face4),
            shoot:		input_binding_gamepad_button(gp_shoulderr),
			altfire:	input_binding_gamepad_button(gp_shoulderrb),
			dash:		input_binding_gamepad_button(gp_shoulderlb),
            
            pause:		input_binding_gamepad_button(gp_start)
        }
    };
}