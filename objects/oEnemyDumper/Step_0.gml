/// @description Insert description here
// You can write your code in this editor


if !instance_exists(pEnemy) and !instance_exists(oCorpse)
{
	with instance_create_layer(x,y,"Interact",oEWalker)
	{
		damage = 0;
		walksp = 0;
		hsp = 0;
		noDMG = true;
	}
	
	repeat(5) instance_create_depth(x,y,depth,oDust);
}


