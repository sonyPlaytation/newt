/// @description


explosion(9999,200,x,y,false,1,undefined,snDeltaruneExpl);

with instance_create_layer(x,y,"Interact",oExitDoor)
{
	vsp = -3;	
	target = rDemo1;
}

instance_destroy(oBossHealth);