///@args weapon_sprite
function hitscanSprite(argument0){

	//hitscan sprites
	
	hSprite[sWand] = sHitWand;
	hSprite[sWandMarksman] = sHitMarksman;
	hSprite[sWandLaserPist] = sHitLaserPist;
	hSprite[sWandSPAS12] = sHitLine;
	hSprite[sWandNTTE] = sHitNTTE;
	
	if !array_any(hSprite,argument0){return noone} else return hSprite[argument0];
	
	
}