

alarm[0] = 60; //destroy body after x frames

flash = 3;
inactive = false;
hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;
screenShake(3,15);
image_speed = 0;
size = global.getSizeKilled;

multiplier = choose(1,1,1,1,2);

expGive();

if (oHealthBar.hpMissing != 0)
{
	if (irandom_range(1,100) <= dropRate + max(oHealthBar.hpMissing,10))
		{
			instance_create_layer(x,y-3,"Player",oHealthGet);
			instance_nearest(x,y,oHealthGet).vsp = -6;
		
		}
}