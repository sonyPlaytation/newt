/// @description

for (var i = 0; i <= springCount; i++)
{
	var _a = -k * springs[i] - d * springsVel[i];
	springsVel[i] += _a;
	springs[i] += springsVel[i];
}

for (var i = 0; i <= springCount; i++)
{
	if (i > 0)
	{
		springDelta[i] = spread * (springs[i] - springs[i-1]);
		springsVel[i-1] += springDeltaL[i];
	}
	if (i < springCount)
	{
		springDeltaR[i] = spread * (springs[i] - springs[i+1]);
		springsVel[i+1] += springDeltaR[i];
	}
}

for (var i = 0; i <= springCount; i++)
{
	if (i > 0)				springs[i-1] += springDeltaL[i];
	if (i< springCount)		springs[i+1] += springDeltaR[i];
}

