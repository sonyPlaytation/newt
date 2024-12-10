/// @description

switch (menu_committed)
{
	case 5: slideTransition(TRANS_MODE.INIT, rBossLobbyTest); break; //BOSS FIGHT
	case 4: global.lvlFloor = 0;	slideTransition(TRANS_MODE.INIT, rTutorialNew6); break; //WHATS NEW
	case 3: global.lvlFloor = 444;	slideTransition(TRANS_MODE.INIT, rTutorialNew1); break; //TUTORIAL
	case 2: slideTransition(TRANS_MODE.INIT, rTest3); break; //NEW GAME
		
	case 1: //CONTINUE
	if (!file_exists(SAVEFILE))
	{
		slideTransition(TRANS_MODE.NEXT);
	}
	else
	{
		var file = file_text_open_read(SAVEFILE);
		var target = file_text_read_real(file);
		global.kills = file_text_read_real(file);
		oGame.combomax = file_text_read_real(file);
		file_text_close(file);
		slideTransition(TRANS_MODE.GOTO,target);
	}
	break;
		
	case 0: game_end(); break; //QUIT
}