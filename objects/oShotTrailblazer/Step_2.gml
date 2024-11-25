/// @description


{
	oSFX.explode = snTrail2;
	//repeat (10)
	{
		trailBlazer(
		3,
		25,
		x + irandom_range(-60,60),
		y + irandom_range(-60,60),
		other.crit,
		1,
		sShotTrailblazer,
		snTrail4
		);
	}
	expCount++;
	
}

if expTimer <= 0 
{
	oSFX.explode = snTrail1;
	expTimer = expReset;
}
else expTimer--;