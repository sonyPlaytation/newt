/// @description Effect Script

if instance_exists(oRoomDetect)
{
	myRoom = instance_nearest(self.x,self.y,oRoomDetect);
}else {myRoom = noone;}

corpse = "";
charred = false;
fresh = 1000;
digest = 500;

sprite = global.corpseSprite;
sprite_index = sprite;
image_speed = 0;
size = global.getSizeKilled;
rot = 0;
col = c_white;
alpha = 1;
done = 0;

decX = 0;
decY = 0;
decay = 1 + decX + decY;

if instance_exists(oNewt) {hitfrom = point_direction(x,y,oNewt.x,oNewt.y)}else hitfrom = 0;;

inactive = false;
flash = 3;
hsp = lengthdir_x(5,hitfrom);
vsp = lengthdir_y(5,hitfrom)-5;
grv = 0.3;
dropRate = 10;
effect = "";
myDamage = noone;

drop = noone;
dropChance = 0;

timer = 0;
corpsePicked = false;

big = 0;
inBelly = false;

multiplier = choose(3,3,3,4,6);
repeat(size*multiplier){instance_create_layer(x,bbox_bottom, "Shots", oSpookyGhost)};
expGive(size,multiplier);
screenShake(3,15);

destroy = function()
{
	oInv.full = 0;
	with oInv.inBelly
	{
		inBelly = false;
		done = 0;
	}
	oInv.inBelly = noone;
	if myDamage!= noone{instance_destroy(myDamage)};
	instance_destroy();
}

funcDigest = function(effect)
{
	switch effect
	{
		
		case "explode":
			explosion();
		break;
		
		case "ammo":
			getAmmo();
		break;
		
		case "hurt":
			var chance = irandom(4);
			if chance == 2{playerHit(1,oNewt)};
		break;
		
		case"heal":
		default:
			playerHeal(1,0);
		break;
	}
}