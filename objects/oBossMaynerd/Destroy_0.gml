/// @description



explosion(9999,200,x,y,false,1,undefined,snDeltaruneExpl);

oInv.souls += 150;
repeat(50) {instance_create_depth(x,y-(sprite_height/2),depth-9999,oSpookyGhost)};

with instance_create_layer(x,y,"Interact",oExitDoor)
{
	vsp = -3;	
	target = rTestDemo1;
}

instance_destroy(oBossHealth);