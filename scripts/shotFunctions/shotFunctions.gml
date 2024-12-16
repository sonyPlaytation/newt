///@args damage
///@args [headshot]
function enemyHit(finalDMG,headshot){

	if (!object_is_ancestor(self.object_index,pPhysProp))
	{
		if headshot == undefined{headshot = false};

		finalDMG = max(0, floor(finalDMG - (finalDMG * (armor/100))));

		//subtract health
		hp -= finalDMG;
			
		//damage numbers
		if (!noDMG)
		{
			repeat(irandom_range(7,20)/oWeapon.bulletnumber) {(instance_create_layer(x,y, layer, oBlood))}
			myDamage.damage += finalDMG;
			myDamage.alpha = 1;
			myDamage.dmgTextScale = 0.75
		}
		
		//if rolled a crit
		if other.crit or (headshot and oWeapon.headshots)
		{
			if (!noDMG){myDamage.dmgTextScale = 1;}
				
			with instance_create_layer(x,y - sprite_height,"Player",oCritHeader)
			{
				owner = other.id;
			}
		} else {global.critTotalDMG += finalDMG}

		oSFX.hit = armor;

		if armor > 1 {flash = 4}else flash = 3;
		
		hitfrom = other.direction;
		coinHit = true;
	}
	else
	{
		idleTimer = 0;
		phy_active = true;
		var physX = lengthdir_x(2,other.image_angle)*(1000-(phy_mass));
		var physY = lengthdir_y(2,other.image_angle)*(1000-(phy_mass));
				
		physics_apply_impulse(x,y,physX,physY);
				
		diedFrom = "standard";
			
		hp -= finalDMG;
			
		global.critTotalDMG += finalDMG;
			
		flash = 3;			
		hitfrom = other.direction;	
	}
}

function drawHitscan(){
	
	if hitSprite!=noone
	{

		draw_alpha -= 0.07;
		draw_set_alpha(draw_alpha);	
	
		// hitscan glow 
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(
		hitSprite,
		1,
		x,
		y-1.5,
		visDist,
		round_Ext(2*(draw_alpha/2),0.25)*5,
		dir,
		col,
		0.15);
	
		// hitscan line real
		gpu_set_blendmode(bm_normal);
		draw_sprite_ext(
		hitSprite,
		1,
		x,
		y,
		visDist,
		round_Ext(2*(draw_alpha/2),0.25),
		dir,
		col,
		1);
	
		draw_set_alpha(1);
	}
	else
	{
		draw_alpha -= 0.3;
		draw_set_alpha(draw_alpha);
		draw_set_color(c_yellow);
		draw_line(x,y,cur_x,cur_y);
		draw_set_alpha(1);	
	}

	if draw_alpha <= 0 instance_destroy();	
}

function homingShot(){
	
	var homingtarget = instance_nearest(mouse_x,mouse_y,pEnemy);
	if global.soda[1]
	{
		color = c_fuchsia;
		if instance_exists(pEnemy)
		{
			if !collision_line(x,y,homingtarget.x,homingtarget.y,oCollide,0,0)
			{
				var targetdir = point_direction(x,y,homingtarget.x,homingtarget.y-homingtarget.sprite_height/2)
				dir += sin(degtorad(targetdir-dir))*8;
			}
		}
	}
		
		draw_set_color(color);

		image_angle = dir
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);

		x += xspd;
		y += yspd;
	
}

function guidedShot(){
	
	if global.soda[1]
	{
		var targetdir = point_direction(x,y,mouse_x,mouse_y)
		dir += sin(degtorad(targetdir-dir))*13;
		
		image_angle = dir
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);

		x += xspd;
		y += yspd;
	
		color = c_fuchsia;
		draw_set_color(color);
	}
	else
	{
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);

		x += xspd;
		y += yspd;
	
		color = c_white;
		draw_set_color(color);
	}
}


///@function					explosion(dmg, rad, x, y, [crit], [friendly], [sprite], [sfx], [newt dmg])
/// @description				Spawns an explosion with multiple parameters.
/// @arg {Real}	Damage
/// @arg {Real}	Radius
/// @arg {Real}	X
/// @arg {Real}	Y
/// @arg {Bool}	Crit
/// @arg {Real}	Friendly
/// @arg {Real}	Sprite
/// @arg {Real}	SFX
/// @arg {Real}	NewtDamage

function explosion(_dmg = 100, _rad = 100, _x = x, _y = y, _crit = false, _friendly = 0, _spr = sExplosion, _sfx = snExplosion, _ndmg = 1)
{	
	with instance_create_layer(_x, _y,"Shots",oExplosion)
	{
		baseDMG = _dmg;
		radius = _rad;
		crit = _crit;
		friendly = _friendly;
		newtDmg = _ndmg;
	}
	
	screenShake(20 * (_rad/100),12 * (_rad/100));
	//if (_rad >= 75) or (_dmg > 100) {camPunch(-1,0.25)};
	
	with instance_create_layer(_x,_y,"Shots",oPartExplosion)
	{
		sprite_index = _spr;
		image_xscale = 1 * (_rad/100);
		image_yscale = 1 * (_rad/100);
	}
	
	oSFX.explode = _sfx;
}


function trailBlazer(_dmg, _rad, _x, _y, _crit, _friendly, _spr, _sfx)
{
	if _dmg == undefined		{_dmg = oWeapon.damage};
	if _rad == undefined		{_rad = 100};
	if _x == undefined			{_x = x};
	if _y == undefined			{_y = y};
	if _crit == undefined		{_crit = false};
	if _friendly == undefined	{_friendly = 0}
	if _spr == undefined		{_spr = sExplosion};
	if _sfx == undefined		{_sfx = snExplosion};
	
	with instance_create_layer(_x, _y,"Shots",oExplosion)
	{
		baseDMG = _dmg;
		radius = _rad;
		crit = _crit;
		friendly = _friendly
	}
	
	screenShake(20 * (_rad/100),12 * (_rad/100));
	with instance_create_layer(_x,_y,"Shots",oPartExplosion)
	{
		image_angle = other.image_angle;
		sprite_index = _spr;
		image_xscale = 1 * (_rad/100);
		image_yscale = 1 * (_rad/100);
	}
	
	oSFX.explode = _sfx;
}