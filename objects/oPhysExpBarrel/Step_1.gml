

//screen pause

if hp < maxHP/2
{
	repeat(5)
	instance_create_layer(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),"Shots",oFlameParticle);
	hp -= 0.5;
}

if (hp<=0) 
{
	explosion();
	instance_destroy();	
};