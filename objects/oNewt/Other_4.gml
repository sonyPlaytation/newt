
if !instance_exists(oWallSplatSurface){instance_create_depth(x,y,depth + 100,oWallSplatSurface)};

//overwrite old save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//crete new save
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file,room);
file_text_write_real(file,global.kills);
file_text_write_real(file,oGame.combomax);
file_text_close(file);