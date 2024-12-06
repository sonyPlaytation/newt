
/// @description draw ammo count

sHeight = oWeapon.sprite_height;
sWidth = oWeapon.sprite_width;

with (oWeapon)
	{
		oAmmoCount.ammoString = ammo[ammotype]
		oAmmoCount.reserveString = ammoMax[ammotype]
	};

if oWeapon.ammouse >= 0
{
	if oWeapon.ammouse > real(ammoString){ammoCol = #eb445a}; //if not enough for a shot
	if oWeapon.ammo[oWeapon.ammotype] == 0{spriteCol = c_dkgray}else{spriteCol = c_white}; // if ammo out, grey out ammo icon
		
	var _ammoScale = 2;	
	
	//ammo icon
	draw_sprite_ext(iAmmoTypes,oWeapon.ammotype,40,995,3,3,0,spriteCol,1);
	
	//ammo counter
		draw_set_font(global.fIgnoreMod);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
	
		draw_set_color(ammoCol);
		draw_text_transformed(150,975,ammoString,_ammoScale,_ammoScale,0);
		
	//ammo reserve counter
		draw_set_halign(fa_left)

		draw_set_color(c_grey);
		draw_text_transformed(155,975,"/" + string(reserveString),_ammoScale,_ammoScale,0);
}

//no alpha if weapon slot empty
if weap[0] != 0 {a0 = 1}else a0 = 0;
if weap[1] != 0 {a1 = 1}else a1 = 0;
if weap[2] != 0 {a2 = 1}else a2 = 0;
	
//little pressy keys when you hit 1-3
if keyboard_check(ord("1")){mark0 = sWeaponSlotPressed}else{mark0 = sWeaponSlot};
if keyboard_check(ord("2")){mark1 = sWeaponSlotPressed}else{mark1 = sWeaponSlot};
if keyboard_check(ord("3")){mark2 = sWeaponSlotPressed}else{mark2 = sWeaponSlot};
	
//draw weapon slots
draw_sprite_ext(mark0,0,uiX-45,uiY,scale,scale,0,col0,a0);
draw_sprite_ext(sWeapList,weap[0],uiX,uiY,scale+(rot0/30),scale+(rot0/30),rot0,c_white,a0);
	
draw_sprite_ext(mark1,1,uiX-45,uiY +gap,scale,scale,0,col1,a1);
draw_sprite_ext(sWeapList,weap[1],uiX,uiY +gap,scale+(rot1/30),scale+(rot1/30),rot1,c_white,a1);
	
draw_sprite_ext(mark2,2,uiX-45,uiY+gap +gap,scale,scale,0,col2,a2);
draw_sprite_ext(sWeapList,weap[2],uiX,uiY +gap +gap,scale+(rot2/30),scale+(rot2/30),rot2,c_white,a2);
	
//weapon slot highlight color
if oWeapon.i=0{col0 = c_yellow; rot0 = min(rot0+4, 25)}else{col0 = c_white; rot0 = max(rot0-4, 0)};
if oWeapon.i=1{col1 = c_yellow; rot1 = min(rot1+4, 25)}else{col1 = c_white; rot1 = max(rot1-4, 0)};
if oWeapon.i=2{col2 = c_yellow; rot2 = min(rot2+4, 25)}else{col2 = c_white; rot2 = max(rot2-4, 0)};
	
	
if (real(ammoString) >= real(reserveString)/4) or oWeapon.ammouse < 1 {ammoCol = c_white; lowAmmo = false;}else{ammoCol = #eb445a; lowAmmo = true;};
	
//ammo reserve chart
for(var i = 0; i< array_length(oWeapon.ammo); i++ )
{
	draw_sprite_ext(iAmmoTypes,i,35 + (i*50),1050,2,2,0,c_white,oWeapon.ammo[i]/oWeapon.ammoMax[i])
	drawSetText(c_white,fSmart,fa_center,fa_top)
			
	var strAmmoCap = string(clamp(oWeapon.ammo[i],0,oWeapon.ammoMax[i]));
			
	uiX2 = 35 + (i*50);
	uiY2 = 1050;
			
	draw_set_color(c_black);
	draw_text_transformed(uiX2+2,uiY2,strAmmoCap,scale2,scale2,0);
	draw_text_transformed(uiX2,uiY2+2,strAmmoCap,scale2,scale2,0);
	draw_text_transformed(uiX2-2,uiY2,strAmmoCap,scale2,scale2,0);
	draw_text_transformed(uiX2,uiY2-2,strAmmoCap,scale2,scale2,0);
			
	draw_set_color(c_white)
	draw_text_transformed(uiX2,uiY2,strAmmoCap,scale2,scale2,0);
}
	
	//soda tracker ui
if sodaPush != -1
{
	oNewt.sodaGot = sodaPush;
	str[sodaPush] = "[sPartEmptyCan,"+string(sodaPush)+"]";
	strSodaCans = string_concat(strSodaCans,str[sodaPush]);
	sodaPush = -1;
}
	
var scrObj = scribble(strSodaCans)
.align(fa_right,fa_center)
.right_to_left(true)
.transform(2,2,0)
	
	
scrObj.draw(RESOLUTION_W-45,1028);


	
	////combo counter
		
	//	draw_set_font(fCanont);
	//	draw_set_halign(fa_left)
		
	//	draw_set_color(c_black);
	//	draw_text(350,1010,"Max Combo: " + string(oGame.combomax));
	
	//	draw_set_color(#eb445a);
	//	draw_text(345,1005,"Max Combo: " + string(oGame.combomax));











