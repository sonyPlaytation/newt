/// @description


repeat(irandom_range(2,5))
{
	with instance_create_depth(x,y,depth,oDust)
	{
		size = random_range(0.5,1.5);
	}
}