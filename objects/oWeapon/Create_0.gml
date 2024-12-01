
mouseX = display_mouse_get_x();
mouseY = display_mouse_get_y();

firingdelay = 0;
recoil = 0;

coinCount = 4;

#region weapons

	#region Weapons 0 - 9	
	// 0 - unarmed
	weapons[0] = ds_map_create();
	ds_map_add(weapons[0],"type",2);
	ds_map_add(weapons[0],"name","Unarmed");
	ds_map_add(weapons[0],"sprite",sWandNull);
	ds_map_add(weapons[0],"shootsfx",-1);
	ds_map_add(weapons[0],"pickupsound",-1);
	ds_map_add(weapons[0],"ammotype",0);
	ds_map_add(weapons[0],"ammouse",0);
	ds_map_add(weapons[0],"altfire",-1);
	ds_map_add(weapons[0],"recoil",0);
	ds_map_add(weapons[0],"accuracy",0);
	ds_map_add(weapons[0],"recoilpush",-5);
	ds_map_add(weapons[0],"shakeamnt",12);
	ds_map_add(weapons[0],"shaketime",4);
	ds_map_add(weapons[0],"damage",20);
	ds_map_add(weapons[0],"cancrit",false);
	ds_map_add(weapons[0],"flash",-1);
	ds_map_add(weapons[0],"projectile",oShotMelee);
	ds_map_add(weapons[0],"bulletnumber",1);
	ds_map_add(weapons[0],"spread",-1);
	ds_map_add(weapons[0],"casing",-1);
	ds_map_add(weapons[0],"startup",0);
	ds_map_add(weapons[0],"length",30); //distance from origin to muzzle
	ds_map_add(weapons[0],"cooldown",30); //tears
	ds_map_add(weapons[0],"bulletspeed",0); //shot speed
	ds_map_add(weapons[0],"automatic",false);
	ds_map_add(weapons[0],"animM1",sWandNull);
	ds_map_add(weapons[0],"animM2",-1);
	ds_map_add(weapons[0],"hitSound",snBatHit);
	ds_map_add(weapons[0],"meleeState",5);
	ds_map_add(weapons[0],"headshots",0);

	// 1 - starter
	weapons[1] = ds_map_create();
	ds_map_add(weapons[1],"type",1);
	ds_map_add(weapons[1],"name", "Wand");
	ds_map_add(weapons[1],"sprite",sWand);
	ds_map_add(weapons[1],"shootsfx",snShotHLPist);
	ds_map_add(weapons[1],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[1],"ammotype",4);
	ds_map_add(weapons[1],"ammouse",1);
	ds_map_add(weapons[1],"altfire",-1);
	ds_map_add(weapons[1],"recoil",4);
	ds_map_add(weapons[1],"accuracy",0);
	ds_map_add(weapons[1],"recoilpush",0);
	ds_map_add(weapons[1],"shakeamnt",0);
	ds_map_add(weapons[1],"shaketime",0);
	ds_map_add(weapons[1],"damage",25)
	ds_map_add(weapons[1],"cancrit",true);
	ds_map_add(weapons[1],"flash",-1);
	ds_map_add(weapons[1],"projectile",oShotHitscan);
	ds_map_add(weapons[1],"bulletnumber",1);
	ds_map_add(weapons[1],"spread",-1);
	ds_map_add(weapons[1],"casing",-1);
	ds_map_add(weapons[1],"startup",0);
	ds_map_add(weapons[1],"length",35);
	ds_map_add(weapons[1],"cooldown",3);
	ds_map_add(weapons[1],"bulletspeed",25);
	ds_map_add(weapons[1],"automatic",false);
	ds_map_add(weapons[1],"headshots",0);
	ds_map_add(weapons[1],"hitSprite",sHitLine);

	// 2 - 1911
	weapons[2] = ds_map_create();
	ds_map_add(weapons[2],"type",1);
	ds_map_add(weapons[2],"name","M1911");
	ds_map_add(weapons[2],"sprite",s1911);
	ds_map_add(weapons[2],"shootsfx",snShot1911);
	ds_map_add(weapons[2],"pickupsound",snCock1911);
	ds_map_add(weapons[2],"ammotype",0);
	ds_map_add(weapons[2],"ammouse",1);
	ds_map_add(weapons[2],"altfire",-1);
	ds_map_add(weapons[2],"recoil",13);
	ds_map_add(weapons[2],"accuracy",4);
	ds_map_add(weapons[2],"recoilpush",3);
	ds_map_add(weapons[2],"shakeamnt",12);
	ds_map_add(weapons[2],"shaketime",7);
	ds_map_add(weapons[2],"damage",30);
	ds_map_add(weapons[2],"cancrit",true);
	ds_map_add(weapons[2],"flash",-1);
	ds_map_add(weapons[2],"projectile",oShotStarter);
	ds_map_add(weapons[2],"bulletnumber",1);
	ds_map_add(weapons[2],"spread",-1);
	ds_map_add(weapons[2],"casing",CASE.PISTOL);
	ds_map_add(weapons[2],"startup",0);
	ds_map_add(weapons[2],"length",25);
	ds_map_add(weapons[2],"cooldown",8);
	ds_map_add(weapons[2],"bulletspeed",45);
	ds_map_add(weapons[2],"automatic",false);
	ds_map_add(weapons[2],"headshots",0);

	// 3 - MP5
	weapons[3] = ds_map_create();
	ds_map_add(weapons[3],"type",0);
	ds_map_add(weapons[3],"name","MP5");
	ds_map_add(weapons[3],"sprite",sMP5);
	ds_map_add(weapons[3],"shootsfx",snShotHLPist);
	ds_map_add(weapons[3],"pickupsound",snCockSPAS12);
	ds_map_add(weapons[3],"ammotype",0);
	ds_map_add(weapons[3],"ammouse", 1);
	ds_map_add(weapons[3],"altfire","contactGrenade");
	ds_map_add(weapons[3],"recoil",5);
	ds_map_add(weapons[3],"accuracy",8);
	ds_map_add(weapons[3],"recoilpush",1);
	ds_map_add(weapons[3],"shakeamnt",5);
	ds_map_add(weapons[3],"shaketime",4);
	ds_map_add(weapons[3],"damage",20);
	ds_map_add(weapons[3],"cancrit",true);
	ds_map_add(weapons[3],"flash",-1);
	ds_map_add(weapons[3],"projectile",oShotStarter);
	ds_map_add(weapons[3],"bulletnumber",1);
	ds_map_add(weapons[3],"spread",-1);
	ds_map_add(weapons[3],"casing",CASE.PISTOL);
	ds_map_add(weapons[3],"startup",0);
	ds_map_add(weapons[3],"length", 30);
	ds_map_add(weapons[3],"cooldown",5);
	ds_map_add(weapons[3],"bulletspeed",45);
	ds_map_add(weapons[3],"automatic",true);
	ds_map_add(weapons[3],"headshots",0);

	// 4 - SPAS 12
	weapons[4] = ds_map_create();
	ds_map_add(weapons[4],"type",1);
	ds_map_add(weapons[4],"name","SPAS 12");
	ds_map_add(weapons[4],"sprite",sSPAS12);
	ds_map_add(weapons[4],"shootsfx",snShotSPAS12);
	ds_map_add(weapons[4],"pickupsound",snCockSPAS12);
	ds_map_add(weapons[4],"ammotype",1);
	ds_map_add(weapons[4],"ammouse",1);
	ds_map_add(weapons[4],"altfire",-1);
	ds_map_add(weapons[4],"recoil",30);
	ds_map_add(weapons[4],"accuracy",2);
	ds_map_add(weapons[4],"recoilpush",1);
	ds_map_add(weapons[4],"shakeamnt",15);
	ds_map_add(weapons[4],"shaketime",15);
	ds_map_add(weapons[4],"damage",16);
	ds_map_add(weapons[4],"cancrit",true);
	ds_map_add(weapons[4],"flash",-1);
	ds_map_add(weapons[4],"projectile",oShotHitscan);
	ds_map_add(weapons[4],"bulletnumber",9);
	ds_map_add(weapons[4],"spread",12);
	ds_map_add(weapons[4],"casing",CASE.SHOTGUN);
	ds_map_add(weapons[4],"startup",0);
	ds_map_add(weapons[4],"length", 0);
	ds_map_add(weapons[4],"cooldown",45);
	ds_map_add(weapons[4],"bulletspeed",60);
	ds_map_add(weapons[4],"automatic",false);
	ds_map_add(weapons[4],"hitSprite",sHitLine);

	// 5 - TF2 Shotgun
	weapons[5] = ds_map_create();
	ds_map_add(weapons[5],"type",1);
	ds_map_add(weapons[5],"name","Dustbowl\nStandard");
	ds_map_add(weapons[5],"sprite",sTF2SG);
	ds_map_add(weapons[5],"shootsfx",snShotTF2SG);
	ds_map_add(weapons[5],"pickupsound",snCockTF2SG);
	ds_map_add(weapons[5],"ammotype",1);
	ds_map_add(weapons[5],"ammouse",1);
	ds_map_add(weapons[5],"altfire",-1);
	ds_map_add(weapons[5],"recoil",10);
	ds_map_add(weapons[5],"accuracy",3);
	ds_map_add(weapons[5],"recoilpush",0);
	ds_map_add(weapons[5],"shakeamnt",8);
	ds_map_add(weapons[5],"shaketime",8);
	ds_map_add(weapons[5],"damage",11);
	ds_map_add(weapons[5],"cancrit",true);
	ds_map_add(weapons[5],"flash",-1);
	ds_map_add(weapons[5],"projectile",oShotHitscan);
	ds_map_add(weapons[5],"bulletnumber",9);
	ds_map_add(weapons[5],"spread",15);
	ds_map_add(weapons[5],"casing",CASE.SHOTGUN);
	ds_map_add(weapons[5],"startup",0);
	ds_map_add(weapons[5],"length", 34);
	ds_map_add(weapons[5],"cooldown",37);
	ds_map_add(weapons[5],"bulletspeed",50);
	ds_map_add(weapons[5],"automatic",true);
	ds_map_add(weapons[5],"hitSprite",sHitLine);

	// 6 - No Time To Explain Laser
	weapons[6] = ds_map_create();
	ds_map_add(weapons[6],"type",1);
	ds_map_add(weapons[6],"name","NTTE-9001");
	ds_map_add(weapons[6],"sprite",sNTTE);
	ds_map_add(weapons[6],"shootsfx",-1);
	ds_map_add(weapons[6],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[6],"ammotype",5);
	ds_map_add(weapons[6],"ammouse",2);
	ds_map_add(weapons[6],"altfire",oContactGrenade);
	ds_map_add(weapons[6],"recoil",5);
	ds_map_add(weapons[6],"accuracy",3);
	ds_map_add(weapons[6],"recoilpush",50);
	ds_map_add(weapons[6],"shakeamnt",15);
	ds_map_add(weapons[6],"shaketime",4);
	ds_map_add(weapons[6],"damage",5);
	ds_map_add(weapons[6],"cancrit",false);
	ds_map_add(weapons[6],"flash",-1);
	ds_map_add(weapons[6],"projectile",oShotLaser);
	ds_map_add(weapons[6],"bulletnumber",1);
	ds_map_add(weapons[6],"spread",-1);
	ds_map_add(weapons[6],"casing",-1);
	ds_map_add(weapons[6],"startup",0);
	ds_map_add(weapons[6],"length", 0);
	ds_map_add(weapons[6],"cooldown",3);
	ds_map_add(weapons[6],"bulletspeed",100);
	ds_map_add(weapons[6],"automatic",true);
	ds_map_add(weapons[6],"headshots",0);
	ds_map_add(weapons[6],"hitSprite",sHitNTTE);

	// 7 - P90
	weapons[7] = ds_map_create();
	ds_map_add(weapons[7],"type",1);
	ds_map_add(weapons[7],"name","P90");
	ds_map_add(weapons[7],"sprite",sP90);
	ds_map_add(weapons[7],"shootsfx",snShotHLPist);
	ds_map_add(weapons[7],"pickupsound",snCock1911);
	ds_map_add(weapons[7],"ammotype",0);
	ds_map_add(weapons[7],"ammouse",1);
	ds_map_add(weapons[7],"altfire",-1);
	ds_map_add(weapons[7],"recoil",3);
	ds_map_add(weapons[7],"accuracy",3);
	ds_map_add(weapons[7],"recoilpush",0.5);
	ds_map_add(weapons[7],"shakeamnt",5);
	ds_map_add(weapons[7],"shaketime",4);
	ds_map_add(weapons[7],"damage",14);
	ds_map_add(weapons[7],"cancrit",true);
	ds_map_add(weapons[7],"flash",-1);
	ds_map_add(weapons[7],"projectile",oShotHitscan);
	ds_map_add(weapons[7],"bulletnumber",1);
	ds_map_add(weapons[7],"spread",-1);
	ds_map_add(weapons[7],"casing",CASE.PISTOL);
	ds_map_add(weapons[7],"startup",0);
	ds_map_add(weapons[7],"length", 25);
	ds_map_add(weapons[7],"cooldown",2);
	ds_map_add(weapons[7],"bulletspeed",30);
	ds_map_add(weapons[7],"automatic",true);
	ds_map_add(weapons[7],"headshots",0);
	ds_map_add(weapons[7],"hitSprite",sHitLine);

	// 8 - Rocket Launcher
	weapons[8] = ds_map_create();
	ds_map_add(weapons[8],"type",0);
	ds_map_add(weapons[8],"name","Rocket\nLauncher");
	ds_map_add(weapons[8],"sprite",sTF2RL);
	ds_map_add(weapons[8],"shootsfx",snShotRocket);
	ds_map_add(weapons[8],"pickupsound",snSuperHeal);
	ds_map_add(weapons[8],"ammotype",3);
	ds_map_add(weapons[8],"ammouse",2);
	ds_map_add(weapons[8],"altfire",-1);
	ds_map_add(weapons[8],"recoil",0);
	ds_map_add(weapons[8],"accuracy",-0);
	ds_map_add(weapons[8],"recoilpush",0);
	ds_map_add(weapons[8],"shakeamnt",0);
	ds_map_add(weapons[8],"shaketime",0);
	ds_map_add(weapons[8],"damage",65);
	ds_map_add(weapons[8],"cancrit",true);
	ds_map_add(weapons[8],"flash",-1);
	ds_map_add(weapons[8],"projectile",oShotRocket);
	ds_map_add(weapons[8],"bulletnumber",1);
	ds_map_add(weapons[8],"spread",-1);
	ds_map_add(weapons[8],"casing",-1);
	ds_map_add(weapons[8],"startup",0);
	ds_map_add(weapons[8],"length",23);
	ds_map_add(weapons[8],"cooldown",30);
	ds_map_add(weapons[8],"bulletspeed",0);
	ds_map_add(weapons[8],"automatic",false);
	ds_map_add(weapons[8],"headshots",0);

	// 9 - BFG
	weapons[9] = ds_map_create();
	ds_map_add(weapons[9],"type",0);
	ds_map_add(weapons[9],"name","BFG 9000");
	ds_map_add(weapons[9],"sprite",sBFG);
	ds_map_add(weapons[9],"shootsfx",snShotBFG);
	ds_map_add(weapons[9],"pickupsound",snSuperHeal);
	ds_map_add(weapons[9],"ammotype",5);
	ds_map_add(weapons[9],"ammouse",80);
	ds_map_add(weapons[9],"altfire",-1);
	ds_map_add(weapons[9],"recoil",40);
	ds_map_add(weapons[9],"accuracy",-0);
	ds_map_add(weapons[9],"recoilpush",50);
	ds_map_add(weapons[9],"shakeamnt",30);
	ds_map_add(weapons[9],"shaketime",10);
	ds_map_add(weapons[9],"damage",80);
	ds_map_add(weapons[9],"cancrit",false);
	ds_map_add(weapons[9],"flash",-1);
	ds_map_add(weapons[9],"projectile",oShotBFG);
	ds_map_add(weapons[9],"bulletnumber",1);
	ds_map_add(weapons[9],"spread",-1);
	ds_map_add(weapons[9],"casing",-1);
	ds_map_add(weapons[9],"startup",30);
	ds_map_add(weapons[9],"length",50);
	ds_map_add(weapons[9],"cooldown",30);
	ds_map_add(weapons[9],"bulletspeed",3);
	ds_map_add(weapons[9],"automatic",true);
	ds_map_add(weapons[9],"headshots",0);
	
	#endregion
	#region Weapons 10 - 19
	
	// 10 - AWP
	weapons[10] = ds_map_create();
	ds_map_add(weapons[10],"type",0);
	ds_map_add(weapons[10],"name","AWP");
	ds_map_add(weapons[10],"sprite",sAWP);
	ds_map_add(weapons[10],"shootsfx",snShotAWP);
	ds_map_add(weapons[10],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[10],"ammotype",2);
	ds_map_add(weapons[10],"ammouse",1);
	ds_map_add(weapons[10],"altfire","scope");
	ds_map_add(weapons[10],"recoil",40);
	ds_map_add(weapons[10],"accuracy",-0);
	ds_map_add(weapons[10],"recoilpush",50);
	ds_map_add(weapons[10],"shakeamnt",30);
	ds_map_add(weapons[10],"shaketime",10);
	ds_map_add(weapons[10],"damage",25);
	ds_map_add(weapons[10],"cancrit",false);
	ds_map_add(weapons[10],"flash",-1);
	ds_map_add(weapons[10],"projectile",oShotSniper);
	ds_map_add(weapons[10],"bulletnumber",1);
	ds_map_add(weapons[10],"spread",-1);
	ds_map_add(weapons[10],"casing",-1);
	ds_map_add(weapons[10],"startup",0);
	ds_map_add(weapons[10],"length",50);
	ds_map_add(weapons[10],"cooldown",60);
	ds_map_add(weapons[10],"bulletspeed",0);
	ds_map_add(weapons[10],"automatic",false);
	ds_map_add(weapons[10],"headshots",0);
	ds_map_add(weapons[10],"hitSprite",sHitLine);	


	// 11 - railgun
	weapons[11] = ds_map_create();
	ds_map_add(weapons[11],"type",0);
	ds_map_add(weapons[11],"name","Railgun");
	ds_map_add(weapons[11],"sprite",sRailgun);
	ds_map_add(weapons[11],"shootsfx",snShotAWP);
	ds_map_add(weapons[11],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[11],"ammotype",5);
	ds_map_add(weapons[11],"ammouse",20);
	ds_map_add(weapons[11],"altfire",-1);
	ds_map_add(weapons[11],"recoil",40);
	ds_map_add(weapons[11],"accuracy",0);
	ds_map_add(weapons[11],"recoilpush",50);
	ds_map_add(weapons[11],"shakeamnt",30);
	ds_map_add(weapons[11],"shaketime",10);
	ds_map_add(weapons[11],"damage",50);
	ds_map_add(weapons[11],"cancrit",false);
	ds_map_add(weapons[11],"flash",-1);
	ds_map_add(weapons[11],"projectile",oShotRailgun);
	ds_map_add(weapons[11],"bulletnumber",1);
	ds_map_add(weapons[11],"spread",-1);
	ds_map_add(weapons[11],"casing",-1);
	ds_map_add(weapons[11],"startup",15);
	ds_map_add(weapons[11],"length",50);
	ds_map_add(weapons[11],"cooldown",60);
	ds_map_add(weapons[11],"bulletspeed",0);
	ds_map_add(weapons[11],"automatic",false);
	ds_map_add(weapons[11],"headshots",0);
	ds_map_add(weapons[11],"hitSprite",sShotRailgun);

	// 12 - FLCL Guitar
	weapons[12] = ds_map_create();
	ds_map_add(weapons[12],"type",0);
	ds_map_add(weapons[12],"name","Rick-4001");
	ds_map_add(weapons[12],"sprite",sFLCL);
	ds_map_add(weapons[12],"shootsfx",snShotSPAS12);
	ds_map_add(weapons[12],"pickupsound",snCockSPAS12);
	ds_map_add(weapons[12],"ammotype",2);
	ds_map_add(weapons[12],"ammouse",1);
	ds_map_add(weapons[12],"altfire","guitarparry");
	ds_map_add(weapons[12],"recoil",30);
	ds_map_add(weapons[12],"accuracy",2);
	ds_map_add(weapons[12],"recoilpush",1);
	ds_map_add(weapons[12],"shakeamnt",60);
	ds_map_add(weapons[12],"shaketime",20);
	ds_map_add(weapons[12],"damage",9);
	ds_map_add(weapons[12],"cancrit",true);
	ds_map_add(weapons[12],"flash",-1);
	ds_map_add(weapons[12],"projectile",oShotFLCL);
	ds_map_add(weapons[12],"bulletnumber",15);
	ds_map_add(weapons[12],"spread",10);
	ds_map_add(weapons[12],"casing",CASE.SHOTGUN);
	ds_map_add(weapons[12],"startup",0);
	ds_map_add(weapons[12],"length", 50);
	ds_map_add(weapons[12],"cooldown",45);
	ds_map_add(weapons[12],"bulletspeed",20);
	ds_map_add(weapons[12],"automatic",false);
	ds_map_add(weapons[12],"animM1",-1);
	ds_map_add(weapons[12],"animM2",sFLCLswing);
	ds_map_add(weapons[12],"hitSound",snBatHit);
	ds_map_add(weapons[12],"meleeState",1);
	ds_map_add(weapons[12],"headshots",0);
	ds_map_add(weapons[12],"hitSprite",sHitFLCL);

	// 13 - Sandman
	weapons[13] = ds_map_create();
	ds_map_add(weapons[13],"type",2);
	ds_map_add(weapons[13],"name","Sandman");
	ds_map_add(weapons[13],"sprite",sSandman);
	ds_map_add(weapons[13],"shootsfx",snWoosh1);
	ds_map_add(weapons[13],"pickupsound",snBatEquip);
	ds_map_add(weapons[13],"ammotype",0);
	ds_map_add(weapons[13],"ammouse",-1);
	ds_map_add(weapons[13],"altfire","baseball");
	ds_map_add(weapons[13],"recoil",0);
	ds_map_add(weapons[13],"accuracy",0);
	ds_map_add(weapons[13],"recoilpush",-5);
	ds_map_add(weapons[13],"shakeamnt",12);
	ds_map_add(weapons[13],"shaketime",4);
	ds_map_add(weapons[13],"damage",65);
	ds_map_add(weapons[13],"cancrit",false);
	ds_map_add(weapons[13],"flash",-1);
	ds_map_add(weapons[13],"projectile",oShotMelee);
	ds_map_add(weapons[13],"bulletnumber",1);
	ds_map_add(weapons[13],"spread",-1);
	ds_map_add(weapons[13],"casing",-1);
	ds_map_add(weapons[13],"startup",0);
	ds_map_add(weapons[13],"length",50); //distance from origin to muzzle
	ds_map_add(weapons[13],"cooldown",16); //tears
	ds_map_add(weapons[13],"bulletspeed",0); //shot speed
	ds_map_add(weapons[13],"automatic",false);
	ds_map_add(weapons[13],"animM1",sSandmanHit);
	ds_map_add(weapons[13],"animM2",sSandmanHit);
	ds_map_add(weapons[13],"hitSound",snBatHit);
	ds_map_add(weapons[13],"meleeState",0);
	ds_map_add(weapons[13],"headshots",0);

	// 14 - Chainsaw
	weapons[14] = ds_map_create();
	ds_map_add(weapons[14],"type",2);
	ds_map_add(weapons[14],"name","The Great\nCommunicator");
	ds_map_add(weapons[14],"sprite",sChainsaw);
	ds_map_add(weapons[14],"shootsfx",3);
	ds_map_add(weapons[14],"pickupsound",snChainsawPickup);
	ds_map_add(weapons[14],"ammotype",3);
	ds_map_add(weapons[14],"ammouse",1);
	ds_map_add(weapons[14],"altfire",-1);
	ds_map_add(weapons[14],"recoil",0);
	ds_map_add(weapons[14],"accuracy",0);
	ds_map_add(weapons[14],"recoilpush",-0.5);
	ds_map_add(weapons[14],"shakeamnt",2);
	ds_map_add(weapons[14],"shaketime",1);
	ds_map_add(weapons[14],"damage",25);
	ds_map_add(weapons[14],"cancrit",false);
	ds_map_add(weapons[14],"flash",-1);
	ds_map_add(weapons[14],"projectile",oShotMelee);
	ds_map_add(weapons[14],"bulletnumber",1);
	ds_map_add(weapons[14],"spread",-1);
	ds_map_add(weapons[14],"casing",oSmoke);
	ds_map_add(weapons[14],"startup",0);
	ds_map_add(weapons[14],"length",40); //distance from origin to muzzle
	ds_map_add(weapons[14],"cooldown",7); //tears
	ds_map_add(weapons[14],"bulletspeed",0); //shot speed
	ds_map_add(weapons[14],"automatic",true);
	ds_map_add(weapons[14],"animM1",sChainsaw);
	ds_map_add(weapons[14],"animM2",-1);
	ds_map_add(weapons[14],"hitSound",snBatHit);
	ds_map_add(weapons[14],"meleeState",3);
	ds_map_add(weapons[14],"headshots",0);

	// 15 - Devil's Gun
	weapons[15] = ds_map_create();
	ds_map_add(weapons[15],"type",1);
	ds_map_add(weapons[15],"name","Devil's Gun");
	ds_map_add(weapons[15],"sprite",sDevilsGun);
	ds_map_add(weapons[15],"shootsfx",snShotDevils);
	ds_map_add(weapons[15],"pickupsound",snCockDevils);
	ds_map_add(weapons[15],"ammotype",4);
	ds_map_add(weapons[15],"ammouse",3);
	ds_map_add(weapons[15],"altfire",-1);
	ds_map_add(weapons[15],"recoil",13);
	ds_map_add(weapons[15],"accuracy",3);
	ds_map_add(weapons[15],"recoilpush",2);
	ds_map_add(weapons[15],"shakeamnt",6);
	ds_map_add(weapons[15],"shaketime",7);
	ds_map_add(weapons[15],"damage",25);
	ds_map_add(weapons[15],"cancrit",true);
	ds_map_add(weapons[15],"projectile",oShotDevilsGun);
	ds_map_add(weapons[15],"bulletnumber",1);
	ds_map_add(weapons[15],"spread",-1);
	ds_map_add(weapons[15],"casing",-1);
	ds_map_add(weapons[15],"startup",0);
	ds_map_add(weapons[15],"length",17);
	ds_map_add(weapons[15],"cooldown",10);
	ds_map_add(weapons[15],"bulletspeed",45);
	ds_map_add(weapons[15],"automatic",false);
	ds_map_add(weapons[15],"headshots",1);

	// 16 - flamethrower
	weapons[16] = ds_map_create();
	ds_map_add(weapons[16],"type",0);
	ds_map_add(weapons[16],"name","Tome of\nPyromancy");
	ds_map_add(weapons[16],"sprite",sFireTome);
	ds_map_add(weapons[16],"shootsfx",-1);
	ds_map_add(weapons[16],"pickupsound",sncockTome);
	ds_map_add(weapons[16],"ammotype",4);
	ds_map_add(weapons[16],"ammouse",1);
	ds_map_add(weapons[16],"altfire","fireball");
	ds_map_add(weapons[16],"recoil",0);
	ds_map_add(weapons[16],"accuracy",0);
	ds_map_add(weapons[16],"recoilpush",0);
	ds_map_add(weapons[16],"shakeamnt",1);
	ds_map_add(weapons[16],"shaketime",2);
	ds_map_add(weapons[16],"damage",15);
	ds_map_add(weapons[16],"cancrit",true);
	ds_map_add(weapons[16],"projectile",oFlame);
	ds_map_add(weapons[16],"bulletnumber",2);
	ds_map_add(weapons[16],"spread",5);
	ds_map_add(weapons[16],"casing",-1);
	ds_map_add(weapons[16],"startup",0);
	ds_map_add(weapons[16],"length",35);
	ds_map_add(weapons[16],"cooldown",3);
	ds_map_add(weapons[16],"bulletspeed",15);
	ds_map_add(weapons[16],"automatic",true);
	ds_map_add(weapons[16],"headshots",0);
	
	// 17 - remington
	weapons[17] = ds_map_create();
	ds_map_add(weapons[17],"type",1);
	ds_map_add(weapons[17],"name","Hunting\nRifle");
	ds_map_add(weapons[17],"sprite",sHuntingRifle);
	ds_map_add(weapons[17],"shootsfx",snShotTF2Sniper);
	ds_map_add(weapons[17],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[17],"ammotype",1);
	ds_map_add(weapons[17],"ammouse",1);
	ds_map_add(weapons[17],"altfire",-1);
	ds_map_add(weapons[17],"recoil",40);
	ds_map_add(weapons[17],"accuracy",-0);
	ds_map_add(weapons[17],"recoilpush",50);
	ds_map_add(weapons[17],"shakeamnt",30);
	ds_map_add(weapons[17],"shaketime",10);
	ds_map_add(weapons[17],"damage",30);
	ds_map_add(weapons[17],"cancrit",false);
	ds_map_add(weapons[17],"flash",-1);
	ds_map_add(weapons[17],"projectile",oShotRifle);
	ds_map_add(weapons[17],"bulletnumber",1);
	ds_map_add(weapons[17],"spread",-1);
	ds_map_add(weapons[17],"casing",-1);
	ds_map_add(weapons[17],"startup",0);
	ds_map_add(weapons[17],"length",50);
	ds_map_add(weapons[17],"cooldown",50);
	ds_map_add(weapons[17],"bulletspeed",0);
	ds_map_add(weapons[17],"automatic",false);
	ds_map_add(weapons[17],"headshots",1);
	ds_map_add(weapons[17],"hitSprite",sHitLine);

	// 18 - M16
	weapons[18] = ds_map_create();
	ds_map_add(weapons[18],"type",0);
	ds_map_add(weapons[18],"name","M16");
	ds_map_add(weapons[18],"sprite",sM16);
	ds_map_add(weapons[18],"shootsfx",snShotM16);
	ds_map_add(weapons[18],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[18],"ammotype",2);
	ds_map_add(weapons[18],"ammouse",1);
	ds_map_add(weapons[18],"altfire",-1);
	ds_map_add(weapons[18],"recoil",40);
	ds_map_add(weapons[18],"accuracy",-0);
	ds_map_add(weapons[18],"recoilpush",1);
	ds_map_add(weapons[18],"shakeamnt",10);
	ds_map_add(weapons[18],"shaketime",5);
	ds_map_add(weapons[18],"damage",15);
	ds_map_add(weapons[18],"cancrit",true);
	ds_map_add(weapons[18],"flash",-1);
	ds_map_add(weapons[18],"projectile",oShotRifle);
	ds_map_add(weapons[18],"bulletnumber",1);
	ds_map_add(weapons[18],"spread",-1);
	ds_map_add(weapons[18],"casing",-1);
	ds_map_add(weapons[18],"startup",0);
	ds_map_add(weapons[18],"length",50);
	ds_map_add(weapons[18],"cooldown",5);
	ds_map_add(weapons[18],"bulletspeed",0);
	ds_map_add(weapons[18],"automatic",false);
	ds_map_add(weapons[18],"headshots",1);
	ds_map_add(weapons[18],"hitSprite",sHitLine);

		// 19 - Volley Gun
	weapons[19] = ds_map_create();
	ds_map_add(weapons[19],"type",1);
	ds_map_add(weapons[19],"name","Volley Gun");
	ds_map_add(weapons[19],"sprite",sVolley);
	ds_map_add(weapons[19],"shootsfx",snShotTF2SG);
	ds_map_add(weapons[19],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[19],"ammotype",1);
	ds_map_add(weapons[19],"ammouse",2);
	ds_map_add(weapons[19],"altfire",-1);
	ds_map_add(weapons[19],"recoil",40);
	ds_map_add(weapons[19],"accuracy",-0);
	ds_map_add(weapons[19],"recoilpush",1);
	ds_map_add(weapons[19],"shakeamnt",14);
	ds_map_add(weapons[19],"shaketime",5);
	ds_map_add(weapons[19],"damage",25);
	ds_map_add(weapons[19],"cancrit", true);
	ds_map_add(weapons[19],"flash",-1);
	ds_map_add(weapons[19],"projectile",oShotVolley);
	ds_map_add(weapons[19],"bulletnumber",4);
	ds_map_add(weapons[19],"spread",20);
	ds_map_add(weapons[19],"casing",CASE.SHOTGUN);
	ds_map_add(weapons[19],"startup",0);
	ds_map_add(weapons[19],"length",10);
	ds_map_add(weapons[19],"cooldown",20);
	ds_map_add(weapons[19],"bulletspeed",23);
	ds_map_add(weapons[19],"automatic",false);
	ds_map_add(weapons[19],"headshots",0);
	
	#endregion
	#region Weapons 20 - 29
	
	// 20 - ultrakill marksman
	weapons[20] = ds_map_create();
	ds_map_add(weapons[20],"type",1);
	ds_map_add(weapons[20],"name", "Marksman");
	ds_map_add(weapons[20],"sprite",sMarksman);
	ds_map_add(weapons[20],"shootsfx",snShotMarksman);
	ds_map_add(weapons[20],"pickupsound",snCockUltrakill);
	ds_map_add(weapons[20],"ammotype",2);
	ds_map_add(weapons[20],"ammouse",1);
	ds_map_add(weapons[20],"altfire","markscoin");
	ds_map_add(weapons[20],"recoil",6);
	ds_map_add(weapons[20],"accuracy",3);
	ds_map_add(weapons[20],"recoilpush",4);
	ds_map_add(weapons[20],"shakeamnt",5);
	ds_map_add(weapons[20],"shaketime",2);
	ds_map_add(weapons[20],"damage",30)
	ds_map_add(weapons[20],"cancrit",true);
	ds_map_add(weapons[20],"flash",-1);
	ds_map_add(weapons[20],"projectile",oShotHitscan);
	ds_map_add(weapons[20],"bulletnumber",1);
	ds_map_add(weapons[20],"spread",-1);
	ds_map_add(weapons[20],"casing",-1);
	ds_map_add(weapons[20],"startup",0);
	ds_map_add(weapons[20],"length",40);
	ds_map_add(weapons[20],"cooldown",10);
	ds_map_add(weapons[20],"bulletspeed",0);
	ds_map_add(weapons[20],"automatic",false);
	ds_map_add(weapons[20],"headshots",0);
	ds_map_add(weapons[20],"hitSprite",sHitMarksman);

	// 21 - Fallout laser pistol
	weapons[21] = ds_map_create();
	ds_map_add(weapons[21],"type",1);
	ds_map_add(weapons[21],"name", "Laser Pistol");
	ds_map_add(weapons[21],"sprite",sLaserPist);
	ds_map_add(weapons[21],"shootsfx",snShotLaserPist);
	ds_map_add(weapons[21],"pickupsound",snCockLaser);
	ds_map_add(weapons[21],"ammotype",5);
	ds_map_add(weapons[21],"ammouse",2);
	ds_map_add(weapons[21],"altfire",-1);
	ds_map_add(weapons[21],"recoil",0);
	ds_map_add(weapons[21],"accuracy",5);
	ds_map_add(weapons[21],"recoilpush",0);
	ds_map_add(weapons[21],"shakeamnt",2);
	ds_map_add(weapons[21],"shaketime",2);
	ds_map_add(weapons[21],"damage",15)
	ds_map_add(weapons[21],"cancrit",false);
	ds_map_add(weapons[21],"flash",-1);
	ds_map_add(weapons[21],"projectile",oShotLaser);
	ds_map_add(weapons[21],"bulletnumber",1);
	ds_map_add(weapons[21],"spread",-1);
	ds_map_add(weapons[21],"casing",-1);
	ds_map_add(weapons[21],"startup",2);
	ds_map_add(weapons[21],"length",50);
	ds_map_add(weapons[21],"cooldown",8);
	ds_map_add(weapons[21],"bulletspeed",0);
	ds_map_add(weapons[21],"automatic",0);
	ds_map_add(weapons[21],"headshots",0);
	ds_map_add(weapons[21],"hitSprite",sHitLaserPist);
	
		// 22 - Uzi
	weapons[22] = ds_map_create();
	ds_map_add(weapons[22],"type",1);
	ds_map_add(weapons[22],"name","Uzi");
	ds_map_add(weapons[22],"sprite",sUzi);
	ds_map_add(weapons[22],"shootsfx",snShotHLPist);
	ds_map_add(weapons[22],"pickupsound",snCock1911);
	ds_map_add(weapons[22],"ammotype",0);
	ds_map_add(weapons[22],"ammouse",1);
	ds_map_add(weapons[22],"altfire",-1);
	ds_map_add(weapons[22],"recoil",6);
	ds_map_add(weapons[22],"accuracy",12);
	ds_map_add(weapons[22],"recoilpush",0);
	ds_map_add(weapons[22],"shakeamnt",6);
	ds_map_add(weapons[22],"shaketime",1);
	ds_map_add(weapons[22],"damage",6);
	ds_map_add(weapons[22],"cancrit",true);
	ds_map_add(weapons[22],"flash",-1);
	ds_map_add(weapons[22],"projectile",oShotHitscan);
	ds_map_add(weapons[22],"bulletnumber",2);
	ds_map_add(weapons[22],"spread",-1);
	ds_map_add(weapons[22],"casing",CASE.PISTOL);
	ds_map_add(weapons[22],"startup",0);
	ds_map_add(weapons[22],"length",35);
	ds_map_add(weapons[22],"cooldown",2);
	ds_map_add(weapons[22],"bulletspeed",0);
	ds_map_add(weapons[22],"automatic",true);
	ds_map_add(weapons[22],"headshots",0);
	ds_map_add(weapons[22],"hitSprite",sHitLine);
	
		// 23 - Killer7
	weapons[23] = ds_map_create();
	ds_map_add(weapons[23],"type",1);
	ds_map_add(weapons[23],"name","Connection");
	ds_map_add(weapons[23],"sprite",sKiller7);
	ds_map_add(weapons[23],"shootsfx",snShotK7);
	ds_map_add(weapons[23],"pickupsound",snCock1911);
	ds_map_add(weapons[23],"ammotype",1);
	ds_map_add(weapons[23],"ammouse",1);
	ds_map_add(weapons[23],"altfire","scope");
	ds_map_add(weapons[23],"recoil",20);
	ds_map_add(weapons[23],"accuracy",6);
	ds_map_add(weapons[23],"recoilpush",4);
	ds_map_add(weapons[23],"shakeamnt",12);
	ds_map_add(weapons[23],"shaketime",7);
	ds_map_add(weapons[23],"damage",35);
	ds_map_add(weapons[23],"cancrit",true);
	ds_map_add(weapons[23],"projectile",oShotK7);
	ds_map_add(weapons[23],"bulletnumber",1);
	ds_map_add(weapons[23],"spread",-1);
	ds_map_add(weapons[23],"casing",3);
	ds_map_add(weapons[23],"startup",0);
	ds_map_add(weapons[23],"length",25);
	ds_map_add(weapons[23],"cooldown",12);
	ds_map_add(weapons[23],"bulletspeed",45);
	ds_map_add(weapons[23],"automatic",false);
	ds_map_add(weapons[23],"headshots",0);
	
		// 24 - Crowbar
	weapons[24] = ds_map_create();
	ds_map_add(weapons[24],"type",2);
	ds_map_add(weapons[24],"name","Crowbar");
	ds_map_add(weapons[24],"sprite",sCrowbar);
	ds_map_add(weapons[24],"shootsfx",snWrenchSwing);
	ds_map_add(weapons[24],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[24],"ammotype",0);
	ds_map_add(weapons[24],"ammouse",-1);
	ds_map_add(weapons[24],"altfire","handgrenade");
	ds_map_add(weapons[24],"recoil",0);
	ds_map_add(weapons[24],"accuracy",0);
	ds_map_add(weapons[24],"recoilpush",-1.5);
	ds_map_add(weapons[24],"shakeamnt",6);
	ds_map_add(weapons[24],"shaketime",2);
	ds_map_add(weapons[24],"damage",35);
	ds_map_add(weapons[24],"cancrit",false);
	ds_map_add(weapons[24],"flash",-1);
	ds_map_add(weapons[24],"projectile",oShotMelee);
	ds_map_add(weapons[24],"bulletnumber",1);
	ds_map_add(weapons[24],"spread",-1);
	ds_map_add(weapons[24],"casing",-1);
	ds_map_add(weapons[24],"startup",0);
	ds_map_add(weapons[24],"length",62); //distance from origin to muzzle
	ds_map_add(weapons[24],"cooldown",13); //tears
	ds_map_add(weapons[24],"bulletspeed",0); //shot speed
	ds_map_add(weapons[24],"automatic",true);
	ds_map_add(weapons[24],"animM1",sCrowbarSwing);
	ds_map_add(weapons[24],"animM2",sCrowbar);
	ds_map_add(weapons[24],"hitSound",snCrowbarHit);
	ds_map_add(weapons[24],"meleeState",3);
	ds_map_add(weapons[24],"headshots",0);
	
		// 25 - Builders Wrench
	weapons[25] = ds_map_create();
	ds_map_add(weapons[25],"type",2);
	ds_map_add(weapons[25],"name","Builders\nWrench");
	ds_map_add(weapons[25],"sprite",sWrenchIdle);
	ds_map_add(weapons[25],"shootsfx",snWrenchSwing);
	ds_map_add(weapons[25],"pickupsound",snBatEquip);
	ds_map_add(weapons[25],"ammotype",0);
	ds_map_add(weapons[25],"ammouse",0);
	ds_map_add(weapons[25],"altfire","sentry");
	ds_map_add(weapons[25],"recoil",0);
	ds_map_add(weapons[25],"accuracy",0);
	ds_map_add(weapons[25],"recoilpush",-5);
	ds_map_add(weapons[25],"shakeamnt",6);
	ds_map_add(weapons[25],"shaketime",2);
	ds_map_add(weapons[25],"damage",65);
	ds_map_add(weapons[25],"cancrit",true);
	ds_map_add(weapons[25],"flash",-1);
	ds_map_add(weapons[25],"projectile",oShotMelee);
	ds_map_add(weapons[25],"bulletnumber",1);
	ds_map_add(weapons[25],"spread",-1);
	ds_map_add(weapons[25],"casing",-1);
	ds_map_add(weapons[25],"startup",5);
	ds_map_add(weapons[25],"length",40); //distance from origin to muzzle
	ds_map_add(weapons[25],"cooldown",20); //tears
	ds_map_add(weapons[25],"bulletspeed",0); //shot speed
	ds_map_add(weapons[25],"automatic",true);
	ds_map_add(weapons[25],"animM1",sWrenchSwing);
	ds_map_add(weapons[25],"animM2",sWrenchIdle);
	ds_map_add(weapons[25],"hitSound",snWrenchHit);
	ds_map_add(weapons[25],"meleeState",4);
	ds_map_add(weapons[25],"headshots",0);
	
		// 25 - Pipe Wrench
	weapons[26] = ds_map_create();
	ds_map_add(weapons[26],"type",2);
	ds_map_add(weapons[26],"name","Pipe Wrench");
	ds_map_add(weapons[26],"sprite",sPipewrenchIdle);
	ds_map_add(weapons[26],"shootsfx",snWrenchSwing);
	ds_map_add(weapons[26],"pickupsound",snBatEquip);
	ds_map_add(weapons[26],"ammotype",0);
	ds_map_add(weapons[26],"ammouse",-1);
	ds_map_add(weapons[26],"altfire","meleeSlice");
	ds_map_add(weapons[26],"recoil",0);
	ds_map_add(weapons[26],"accuracy",0);
	ds_map_add(weapons[26],"recoilpush",-5);
	ds_map_add(weapons[26],"shakeamnt",6);
	ds_map_add(weapons[26],"shaketime",2);
	ds_map_add(weapons[26],"damage",65);
	ds_map_add(weapons[26],"cancrit",true);
	ds_map_add(weapons[26],"flash",-1);
	ds_map_add(weapons[26],"projectile",oShotMelee);
	ds_map_add(weapons[26],"bulletnumber",1);
	ds_map_add(weapons[26],"spread",-1);
	ds_map_add(weapons[26],"casing",-1);
	ds_map_add(weapons[26],"startup",4);
	ds_map_add(weapons[26],"length",40); //distance from origin to muzzle
	ds_map_add(weapons[26],"cooldown",18); //tears
	ds_map_add(weapons[26],"bulletspeed",0); //shot speed
	ds_map_add(weapons[26],"automatic",true);
	ds_map_add(weapons[26],"animM1",sPipewrenchSwing);
	ds_map_add(weapons[26],"animM2",sPipewrenchIdle);
	ds_map_add(weapons[26],"hitSound",snWrenchHit);
	ds_map_add(weapons[26],"meleeState",0);
	ds_map_add(weapons[26],"headshots",0);
	
	// 5 - TF2 Shotgun
	weapons[27] = ds_map_create();
	ds_map_add(weapons[27],"type",1);
	ds_map_add(weapons[27],"name","Mare's Leg");
	ds_map_add(weapons[27],"sprite",sMaresLeg);
	ds_map_add(weapons[27],"shootsfx",snShotTF2SG);
	ds_map_add(weapons[27],"pickupsound",snCockTF2SG);
	ds_map_add(weapons[27],"ammotype",1);
	ds_map_add(weapons[27],"ammouse",1);
	ds_map_add(weapons[27],"altfire","arnoldflip");
	ds_map_add(weapons[27],"recoil",15);
	ds_map_add(weapons[27],"accuracy",2);
	ds_map_add(weapons[27],"recoilpush",1);
	ds_map_add(weapons[27],"shakeamnt",9);
	ds_map_add(weapons[27],"shaketime",7);
	ds_map_add(weapons[27],"damage",10);
	ds_map_add(weapons[27],"cancrit",true);
	ds_map_add(weapons[27],"flash",-1);
	ds_map_add(weapons[27],"projectile",oShotHitscan);
	ds_map_add(weapons[27],"bulletnumber",10);
	ds_map_add(weapons[27],"spread",15);
	ds_map_add(weapons[27],"casing",CASE.SHOTGUN);
	ds_map_add(weapons[27],"startup",0);
	ds_map_add(weapons[27],"length", 34);
	ds_map_add(weapons[27],"cooldown",37);
	ds_map_add(weapons[27],"bulletspeed",0);
	ds_map_add(weapons[27],"automatic",true);
	ds_map_add(weapons[27],"hitSprite",sHitLine);
	ds_map_add(weapons[27],"animM1",sMaresParry);
	ds_map_add(weapons[27],"animM2",sMaresParry);
	ds_map_add(weapons[27],"hitSound",snBatHit);
	ds_map_add(weapons[27],"meleeState",1);
	
	// 1 - starter
	weapons[28] = ds_map_create();
	ds_map_add(weapons[28],"type",0);
	ds_map_add(weapons[28],"name", "TEST BALL GUN");
	ds_map_add(weapons[28],"sprite",sWand);
	ds_map_add(weapons[28],"shootsfx",snShotHLPist);
	ds_map_add(weapons[28],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[28],"ammotype",0);
	ds_map_add(weapons[28],"ammouse",0);
	ds_map_add(weapons[28],"altfire",-1);
	ds_map_add(weapons[28],"recoil",0);
	ds_map_add(weapons[28],"accuracy",0);
	ds_map_add(weapons[28],"recoilpush",0);
	ds_map_add(weapons[28],"shakeamnt",0);
	ds_map_add(weapons[28],"shaketime",0);
	ds_map_add(weapons[28],"damage",0)
	ds_map_add(weapons[28],"cancrit",false);
	ds_map_add(weapons[28],"flash",-1);
	ds_map_add(weapons[28],"projectile",oPhysBaseball);
	ds_map_add(weapons[28],"bulletnumber",1);
	ds_map_add(weapons[28],"spread",-1);
	ds_map_add(weapons[28],"casing",-1);
	ds_map_add(weapons[28],"startup",0);
	ds_map_add(weapons[28],"length",35);
	ds_map_add(weapons[28],"cooldown",3);
	ds_map_add(weapons[28],"bulletspeed",100);
	ds_map_add(weapons[28],"automatic",false);
	ds_map_add(weapons[28],"headshots",0);
	ds_map_add(weapons[28],"hitSprite",sHitLine);
	
	// 1 - starter
	weapons[29] = ds_map_create();
	ds_map_add(weapons[29],"type",0);
	ds_map_add(weapons[29],"name", "Trailblazer");
	ds_map_add(weapons[29],"sprite",sWand);
	ds_map_add(weapons[29],"shootsfx",snTrail2);
	ds_map_add(weapons[29],"pickupsound",snHL1Pickup);
	ds_map_add(weapons[29],"ammotype",4);
	ds_map_add(weapons[29],"ammouse",5);
	ds_map_add(weapons[29],"altfire",-1);
	ds_map_add(weapons[29],"recoil",50);
	ds_map_add(weapons[29],"accuracy",0);
	ds_map_add(weapons[29],"recoilpush",50);
	ds_map_add(weapons[29],"shakeamnt",30);
	ds_map_add(weapons[29],"shaketime",3);
	ds_map_add(weapons[29],"damage",65)
	ds_map_add(weapons[29],"cancrit",false);
	ds_map_add(weapons[29],"flash",-1);
	ds_map_add(weapons[29],"projectile",oShotTrailblazer);
	ds_map_add(weapons[29],"bulletnumber",1);
	ds_map_add(weapons[29],"spread",-1);
	ds_map_add(weapons[29],"casing",-1);
	ds_map_add(weapons[29],"startup",0);
	ds_map_add(weapons[29],"length",35);
	ds_map_add(weapons[29],"cooldown",60);
	ds_map_add(weapons[29],"bulletspeed",10);
	ds_map_add(weapons[29],"automatic",false);
	ds_map_add(weapons[29],"headshots",0);
	
	#endregion

#endregion

#region

	prop = noone;

	//casings
	enum CASE{
	PISTOL = 1,
	SHOTGUN = 2
	}

	//list of all weapons
	global.weaplistsize = array_length(weapons) - 1;

	//something to do with your weapon inventory
	i = 0;
	m = 0;
	k = 0;
	myInfo = noone;
	active = false;

	//your weapons
	heldweapons[0] = 0;
	heldweapons[1] = 0;
	heldweapons[2] = 0;

	//ammo inventory
	ammo[0] = 0;		//light
	ammo[1] = 0;		//medium
	ammo[2] = 0;		//heavy
	ammo[3] = 0;		//explosive
	ammo[4] = 0;		//magic
	ammo[5] = 0;		//energy

	//ammo capacity
	ammoMax[0] = 256;	//light
	ammoMax[1] = 128;	//medium
	ammoMax[2] = 64;	//heavy
	ammoMax[3] = 50;	//explosive
	ammoMax[4] = 160;	//magic
	ammoMax[5] = 200;	//energy
	
	shotNumber = 0;
	
#endregion

weaponStats(0);


current_cd = 0;
current_delay = -1;
current_recoil = 0;

delayRight = 0;

showLaser = false;
crit = false;

snPlaying = noone;

soundNicer = function()
{
	var _pitch = 1;
	if automatic{_pitch = random_range(0.9,1.1)};
	if snPlaying != noone {audio_sound_gain(snPlaying,0.5,15)};
	snPlaying = audio_play_sound(shootsfx, 600, false,1,0,);
}

fireWeapon = function()
{
	var mouseLeft;			
	if (automatic) mouseLeft = input_check("shoot"); else mouseLeft = input_check_pressed("shoot");
	
	if (mouseLeft)and oNewt.propBuffer <= 0
	{
		if (current_cd == 0)
		{
			current_cd = cooldown;
			current_delay = startup;	
			image_index = 0;
		}
		image_speed = 1;
	}

	var _spread = spread;
	var _spreadDiv = _spread / max( bulletnumber - 1, 1 );
			
	if oNewt.hasControl && (current_delay == 0) && (projectile != -1)
	{
		if (ammo[ammotype] >= ammouse) and (bulletnumber != -1)
		{	
			if (shootsfx != -1){soundNicer();}
			ammo[ammotype] -= ammouse;
							
			for (var j = 0; j < bulletnumber; j++)
			{
				shotNumber++;
				screenShake(shakeamnt,shaketime);	
							
				with (instance_create_layer(x+lengthdir_x(length,image_angle),(y+lengthdir_y(length,image_angle)),"Shots",projectile))
				{
					if (other.cancrit == 1) and global.hasCrit or global.critTimer > 0
					{
						oSFX.critshot = true;
						crit = global.hasCrit;
					}else crit = false;
					global.hasCrit = false;
							
					if other.headshots{headshot = true};
							
					shotNumber = other.shotNumber;
					hitSprite = other.hitSprite;
					dir = other.image_angle- _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
					spd = other.bulletspeed;
					image_angle = dir;
								
					if other.projectile == oPhysBaseball
					{
						var _physX = lengthdir_x(other.bulletspeed, other.image_angle) * 10000
						var _physY = lengthdir_y(other.bulletspeed, other.image_angle) * 10000
									
						physics_apply_impulse(x,y,_physX,_physY);
					}
					else
					{
						image_xscale = max(1,spd/sprite_width);
					}
				}

				with(oNewt)
				{
					if (state != stateCrouch)
					{	
						hsp -= lengthdir_x(other.recoilpush,other.image_angle);
						vsp -= lengthdir_y(other.recoilpush,other.image_angle);
					}
				}	
				global.shotNumber = j;
			}
							
			if casing == oSmoke{instance_create_layer(x,y,"Player",oSmoke)}					
			else if casing != -1
			{
				with (instance_create_layer(x,y,"Player",oCasing))
				{
					image_index = other.casing;
					hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
					vsp =  random_range(-7, -5);
					if (sign(hsp)!=0) image_xscale = sign(hsp); 	
				}
			}
		}
		current_recoil = recoil;
		if (ammo[ammotype] < ammouse) and mouseLeft {audio_play_sound(snNoAmmo,300,false)};
	}

	//right click
	altFires(altfire);
		
	var _dir = image_angle;

	x = x - lengthdir_x(min(current_recoil,4), _dir);
	y = y - lengthdir_y(min(current_recoil,4), _dir);
}

swingMelee = function()
{
	var mouseLeft;			
	if (automatic) mouseLeft = input_check("shoot"); else mouseLeft = input_check_pressed("shoot");
	
	if (mouseLeft) and oNewt.propBuffer <= 0
		{
			if (current_cd == 0)
			{
				current_cd = cooldown;
				current_delay = startup;	
						
				image_index = 0;
				sprite_index = animM1;
				image_speed = 1;
			}	
		}

		var _spread = spread;
		var _spreadDiv = _spread / max( bulletnumber - 1, 1 );

		if oNewt.hasControl && (current_delay == 0) && (projectile != -1)
		{	
			if (ammo[ammotype] >= ammouse) and (bulletnumber != -1)
			{	
				if (shootsfx != -1)	
				{
					soundNicer();
				}
				if ammouse >= 0 {ammo[ammotype] -= ammouse};
		
				for (var j = 0; j < bulletnumber; j++)
				{
					screenShake(shakeamnt,shaketime);	
					with (instance_create_layer(x,y,"Shots",projectile))
					{
						if (other.cancrit == 1) and global.hasCrit or global.critTimer > 0
						{
							oSFX.critshot = true;
							crit = global.hasCrit;
							
						}else crit = false;
						global.hasCrit = false;
									
						click = 0;
						image_xscale = other.length+point_distance(x,y,oNewt.x,global.newtCenter);
						direction = other.image_angle- _spread/2 + _spreadDiv * j + random_range(-other.accuracy,other.accuracy);
						speed = other.bulletspeed;
						image_angle = direction;
					}

					with(oNewt)
					{
						hsp -= lengthdir_x(other.recoilpush,other.image_angle);
						vsp -= lengthdir_y(other.recoilpush,other.image_angle);
					}
					global.shotNumber = j;
				}
							
				if casing == oSmoke{instance_create_layer(x,y,"Player",oSmoke)}					
				else if casing != -1
				{
					with (instance_create_layer(x,y,"Player",oCasing))
					{
						image_index = other.casing;
						hsp = lengthdir_x(3, other.image_angle-180 + random_range(-10, 10));
						vsp =  random_range(-7, -5);
						if (sign(hsp)!=0) image_xscale = sign(hsp); 	
					}
				}
			}
			current_recoil = recoil;
			if (ammo[ammotype] < ammouse) and mouseLeft {audio_play_sound(snNoAmmo,300,false)};
		}

		//right click
		altFires(altfire);

		var _dir = image_angle;

		x = x - lengthdir_x(min(current_recoil,4), _dir);
		y = y - lengthdir_y(min(current_recoil,4), _dir);

}
