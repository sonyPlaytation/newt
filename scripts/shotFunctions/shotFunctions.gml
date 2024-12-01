///@args damage
///@args [headshot]
function enemyHit(finalDMG,headshot){

	if (!object_is_ancestor(self.object_index,pPhysProp))
	{
		if headshot == undefined{headshot = false};

		finalDMG = max(0, finalDMG - (finalDMG * (armor/100)));

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
				owner = other.id	
			}
		} else {global.critTotalDMG += finalDMG}

		oSFX.hit = armor;

		if armor > 1 {flash = 10}else flash = 3;
		
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
		y,
		visDist,
		round_Ext(2*(draw_alpha/2),0.25)*5,
		dir,
		col,
		0.15);
	
		if hitSprite != sHitFLCL
		{
			draw_sprite_ext(
			hitSprite,
			0,
			x,
			y,
			round_Ext(draw_alpha*flashScale*1.5,0.25),
			round_Ext(draw_alpha*flashScale*1.5,0.25),
			dir,
			col,
			draw_alpha*0.15);
		}
	
		gpu_set_blendmode(bm_normal);
	
		//--------------------------------------------------------------//
	
		// hitscan line real
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
	
		if oWeapon.bulletnumber == 1
		{
			//muzzle flash (frame zero)
			draw_sprite_ext(
			hitSprite,
			0,
			x,
			y,
			round_Ext(draw_alpha*flashScale,0.25),
			round_Ext(draw_alpha*flashScale,0.25),
			dir,
			col,
			1);
		}
		else
		{
			if (shotNumber == oWeapon.bulletnumber){draw_sprite_ext(hitSprite,0,x,y,flashScale,flashScale,dir,col,draw_alpha);shotNumber++};
		}
	
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
	if global.soda[1] and instance_exists(pEnemy)
	{
		if !collision_line(x,y,homingtarget.x,homingtarget.y,oCollide,0,0)
		{
			var targetdir = point_direction(x,y,homingtarget.x,homingtarget.y-homingtarget.sprite_height/2)
			dir += sin(degtorad(targetdir-dir))*8;
		}
		
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
	}	
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

///@args damage
///@args radius
///@args x
///@args y
///@args [crit]
///@args [friendly]
///@args [sprite]
///@args [sfx]

function explosion(_dmg, _rad, _x, _y, _crit, _friendly, _spr, _sfx)
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