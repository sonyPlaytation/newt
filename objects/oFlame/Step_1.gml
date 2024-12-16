

//screen pause
if screenPause() {exit;};

//if image_xscale > 3
//{
//	var _smkHi = random_range(12,20)
//	with instance_create_depth(x,y-_smkHi,depth,oSmoke)	
//	{
//		owner = other.id;
//		depth = owner.depth +250
//		vsp = vsp - (owner.image_xscale/10)
//		image_xscale = owner.image_xscale/8;
//		image_yscale = image_xscale;
//		image_speed = 0.25;
//	}
//}

if input_check("shoot"){oSFX.flamethrowerloop = true} else oSFX.flamethrowerloop = false;

image_xscale *= 1.10;
image_yscale = image_xscale;

homingShot();

if crit {draw_set_color(c_red)};

var _x = 0;
var _y = 0;

repeat(ceil(image_xscale/4))
{
	_x = x + random_range(-7,7); 
	_y = y + random_range(-7,7); 
	
	with instance_create_layer(_x,_y,"Shots",oFlameParticle)
	{
		owner = other.id;
		dir = owner.image_angle-180;
		
		image_xscale = owner.image_xscale/3;
		image_yscale = image_xscale;
	}
};

if (place_meeting(x,y,pEntity)) and instance_exists(oNewt)
{
	dist = point_distance(oNewt.x,oNewt.y-22,x,y);
	var target = (instance_place(x,y,pEntity));
	with target
	{
		
		if !inactive
		{
			diedFrom = "fire";
			
			instance_create_depth(target.x,target.y-sprite_height,depth,oSmoke)
			
			//damage calculation
			if (other.crit == true) {finalDMG = other.baseDMG * 3}
			else finalDMG = standardFalloff(other.dist,other.baseDMG);
			
			//subtract health
			hp -= finalDMG;
			
			//damage numbers
			if (!noDMG)
			{
				repeat(irandom_range(7,20)) {(instance_create_layer(target.x,target.y-(sprite_height/2), "Player", oBlood))}
				myDamage.damage += finalDMG;
				myDamage.alpha = 1;
				myDamage.dmgTextScale = 0.75
			}
			
			//if rolled a crit
			if (other.crit == true)
			{
				if !noDMG {myDamage.dmgTextScale = 1};
				
				with instance_create_layer(target.x,target.y - target.sprite_height,"Player",oCritHeader)
				{
					owner = target.id	
				}
			} else {global.critTotalDMG += finalDMG}
			
			flash = 3;
			hitfrom = other.direction;			
		}
	}
	instance_destroy();
	outline_end();
}

if (place_meeting(x,y,oCollide)) && (image_index != 0) 
{
	global.hasCrit = false;
	instance_destroy();
	outline_end();
}

if place_meeting(x,y,oCorpse)
{with instance_place(x,y,oCorpse) charred = true; instance_destroy();};
