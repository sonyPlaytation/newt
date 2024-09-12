/// @description progress text

if instance_exists(owner)
{
	if owner = oNewt
	{
		weaponStats(array_get(oMultiWeapon.heldweapons, oMultiWeapon.type)); 
	}
	else
	{
		weaponStats(weapon);
	}
	
	//Name
	var _name = "[c_yellow]"+name+"[c_white][fMecha]";
	
	//Line One
	if bulletnumber > 1 {var _bulletnumber = "x"+string(bulletnumber)}else var _bulletnumber = "";
	var _damage = "[iDamage]"+string(damage)+_bulletnumber;
	var _firerate = "[iFireRate]"+string(60/cooldown);
	
	var _lineone = string_join("[iDivider]",_damage,_firerate);
	
	//Line Two
	var _ammouse = "[iAmmoTypes,"+string(ammotype)+"]"+string(ammouse);
	var _accCalc = (10-accuracy);
	var _accuracy = "[iAccuracy]"+string(_accCalc);
	
	var _linetwo = string_join("[iDivider]",_ammouse,_accuracy);
	
	//Icons
	scribble_anim_pulse(0.5,0.1);
	var _type = string("[iWeaponSlot,"+string(type)+"]")
	if altfire != -1 {var _altfire ="[pulse][iAltFire][/pulse]"}else var _altfire = "[c_grey][iAltFire][c_white]";
	if headshots {var _headshots = "[pulse][iHeadshots][/pulse]"}else var _headshots = "[c_grey][iHeadshots][c_white]";
	if cancrit {var _crits ="[pulse][iCrits][/pulse]"} else var _crits = "[c_grey][iCrits][c_white]";
	
	var _icons = string_join("[scale,1.1][nbsp]",_type,_altfire,_headshots,_crits);
	
	if owner == oNewt
	{
		depth = -9999
		x = oCamera.x-340
		y = oCamera.y+210
	}
	else
	{
		y = owner.ystart-29;
		depth = owner.depth-1;
		
	}
	
	letters += spd;
	text_current = string_join("\n",_name,_lineone,_linetwo,_icons);
	scribble_anim_wave(5,1,0.05)
	if owner.randomWand {text_current = "[scale,2][fMecha][rainbow][wave]???"}

	h = string_height_scribble(text_current);
	w = string_width_scribble(text_current);

}else instance_destroy();