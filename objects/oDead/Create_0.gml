
alarm[0] = 30;

screenShake(8,60);
audio_play_sound(snNewtDie,800,false);

with(oCamera) follow = other.id;

alpha = 1;
done = 0;
col = c_white;
rot = 0;

flash = 3;
grv = 0.25;
		
hsp = image_xscale * 3;