
audio_play_sound(snHL1Explosion,600,false)
repeat(radius/10)
		{
			with (instance_create_layer(x,y, "Player", oDust))
			{hsp = random_range(-other.dustRad,other.dustRad)
			vsp = random_range(-other.dustRad,other.dustRad);}
		}
instance_destroy();