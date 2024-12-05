/// @description

if width < target
{
	width *= 1.25;
}

if height < target and width >= target
{
	height *= 1.25;
}

if width >= target and height >= target
{
	alpha -= 0.025;	
}

if alpha < 0 {global.flashDone = true; instance_destroy();}