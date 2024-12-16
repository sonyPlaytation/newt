

hsp = 0;
vsp = 0;
grv = 0.2;
done = 0;

image_speed = 0;
image_index = 0;

//if instance_exists(oMultiWeapon) {instance_destroy(oMultiWeapon)};

screenShake(8,60);
audio_play_sound(snNewtDie,800,false);

with(oCamera) follow = other.id;