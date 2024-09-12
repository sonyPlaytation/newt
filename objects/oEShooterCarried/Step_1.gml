
if instance_exists(owner)
{
depth = owner.depth+10;
image_xscale = owner.image_xscale;
x = owner.x - sprite_width/6;
y = owner.y +sprite_height - 6;
}

if !instance_exists(owner) 
{
	instance_destroy(mygun);
	if !instance_exists(owner) 
	{
		with instance_create_depth(x,y,depth,oEShooter)
		{
			hp = other.hp;
			maxHP = other.maxHP;
		
			myDamage = instance_create_layer(x,y,"GUI",oDmgNum);
			with (myDamage)
			{
				owner = other.id		
			}
		}
		instance_destroy();
	}
}

event_inherited();