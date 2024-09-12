
///@args distance
///@args base damage
function standardFalloff(argument0, argument1){

	finalDMG = ceil(clamp(argument1 * (argument1 / (argument0/12)),argument1 * 0.7 ,argument1 * 1.35))
	return  finalDMG;

}

///@args distance
///@args base damage
function sniperFalloff(argument0, argument1){

	finalDMG = ceil(clamp(argument1 + (argument1 * ((argument0/12))/8.5),argument1 * 0.5 ,argument1 * 40))
	return  finalDMG;

}