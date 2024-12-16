// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camPunch(_amnt = 1, _speed = 0.5){
	with oCamera
	{
		zoomLerp = _speed;
		currZoom = zoom[global.gameState]+_amnt;
	}
}