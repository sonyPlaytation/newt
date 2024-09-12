///@args weapon
function weaponStats(weapon){

	if instance_exists(oMultiWeapon)
	{
		var wp_map = oMultiWeapon.weapons[weapon];
		type		= wp_map[? "type"];
		name		= wp_map[? "name"];
		sprite		= wp_map[? "sprite"];
		shootsfx	= wp_map[? "shootsfx"];
		pickupsound	= wp_map[? "pickupsound"];
		ammotype	= wp_map[? "ammotype"];
		ammouse		= wp_map[? "ammouse"];
		altfire		= wp_map[? "altfire"];
		recoil		= wp_map[? "recoil"];
		accuracy	= wp_map[? "accuracy"];
		recoilpush	= wp_map[? "recoilpush"];
		shakeamnt	= wp_map[? "shakeamnt"];
		shaketime	= wp_map[? "shaketime"];
		damage		= wp_map[? "damage"];
		cancrit		= wp_map[? "cancrit"];
		projectile	= wp_map[? "projectile"];
		bulletnumber= wp_map[? "bulletnumber"];
		spread		= wp_map[? "spread"];
		casing		= wp_map[? "casing"];
		startup		= wp_map[? "startup"];
		length		= wp_map[? "length"];
		cooldown	= wp_map[? "cooldown"];
		bulletspeed = wp_map[? "bulletspeed"];
		automatic	= wp_map[? "automatic"];
		animM1		= wp_map[? "animM1"];
		animM2		= wp_map[? "animM2"];
		hitSound	= wp_map[? "hitSound"];
		meleeState	= wp_map[? "meleeState"];
		headshots	= wp_map[? "headshots"];
		hitSprite	= wp_map[? "hitSprite"];

		global.heldweapon = weapon;
	}
}

