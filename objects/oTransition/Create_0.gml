/// @desc size variables and mode setup

fullscreen = false;

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h/2;

enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	INIT
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;



