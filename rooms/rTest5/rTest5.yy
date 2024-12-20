{
  "$GMRoom":"v1",
  "%Name":"rTest5",
  "creationCodeFile":"",
  "inheritCode":false,
  "inheritCreationOrder":false,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_724BC3C8_1_2_1_1","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_511FF669_1_1","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_2C2BB986_1_1","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_2A93C744_1","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_231046C3_1","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_39BD81CF_1","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_656C75BA","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_43C9FDBF","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_6FFC5FA0","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_527B5F54","path":"rooms/rTest5/rTest5.yy",},
    {"name":"inst_514B1AD8","path":"rooms/rTest5/rTest5.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRInstanceLayer":"","%Name":"Shots","depth":0,"effectEnabled":true,"effectType":null,"gridX":12,"gridY":12,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"name":"Shots","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRInstanceLayer":"","%Name":"Weapon","depth":100,"effectEnabled":true,"effectType":null,"gridX":12,"gridY":12,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_2A93C744_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_2A93C744_1","objectId":{"name":"oWeaponPickup","path":"objects/oWeaponPickup/oWeaponPickup.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oWeaponPickup","path":"objects/oWeaponPickup/oWeaponPickup.yy",},"propertyId":{"name":"randomWand","path":"objects/oWeaponPickup/oWeaponPickup.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"False",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oWeaponPickup","path":"objects/oWeaponPickup/oWeaponPickup.yy",},"propertyId":{"name":"weapon","path":"objects/oWeaponPickup/oWeaponPickup.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"10",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":168.0,"y":924.0,},
      ],"layers":[],"name":"Weapon","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRInstanceLayer":"","%Name":"Player","depth":200,"effectEnabled":true,"effectType":null,"gridX":12,"gridY":12,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_724BC3C8_1_2_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_724BC3C8_1_2_1_1","objectId":{"name":"oNewt","path":"objects/oNewt/oNewt.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":228.0,"y":936.0,},
      ],"layers":[],"name":"Player","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRAssetLayer":"","%Name":"Assets_1","assets":[],"depth":300,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Assets_1","properties":[],"resourceType":"GMRAssetLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRInstanceLayer":"","%Name":"Enemy","depth":400,"effectEnabled":true,"effectType":null,"gridX":12,"gridY":12,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_511FF669_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_511FF669_1_1","objectId":{"name":"oLockDoor","path":"objects/oLockDoor/oLockDoor.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":120.0,"y":936.0,},
        {"$GMRInstance":"v1","%Name":"inst_2C2BB986_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_2C2BB986_1_1","objectId":{"name":"oExitDoor","path":"objects/oExitDoor/oExitDoor.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oExitDoor","path":"objects/oExitDoor/oExitDoor.yy",},"propertyId":{"name":"target","path":"objects/oExitDoor/oExitDoor.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"rTest3",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1320.0,"y":924.0,},
      ],"layers":[],"name":"Enemy","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRTileLayer":"","%Name":"Tiles_1","depth":500,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Tiles_1","properties":[],"resourceType":"GMRTileLayer","resourceVersion":"2.0","tiles":{"SerialiseHeight":42,"SerialiseWidth":57,"TileCompressedData":[
          -50,0,-7,-2147483648,-50,0,-7,-2147483648,-50,0,-7,-2147483648,-50,0,-7,-2147483648,-50,0,-7,-2147483648,
          -50,0,-7,-2147483648,-50,0,-7,-2147483648,-50,0,-7,-2147483648,-50,0,-7,-2147483648,-2,0,-53,28,-2,-2147483648,
          -2,0,1,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,
          -2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,
          -2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,
          6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,
          -2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,
          0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,
          -2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,
          -2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,
          6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,
          -2147483648,6,28,-2147483648,-2147483648,0,0,28,-47,0,-4,-2147483648,1,28,-4,-2147483648,1,28,-51,-2147483648,
          1,28,-4,-2147483648,1,28,-51,-2147483648,1,28,-4,-2147483648,1,28,-51,-2147483648,1,28,-4,-2147483648,
          1,28,-51,-2147483648,1,28,-4,-2147483648,1,28,-51,-2147483648,1,28,-4,-2147483648,1,28,-51,-2147483648,
          1,28,-4,-2147483648,1,28,-51,-2147483648,1,28,-4,-2147483648,1,28,-227,-2147483648,-53,28,-116,-2147483648,
        ],"TileDataFormat":1,},"tilesetId":{"name":"tFloorOne","path":"tilesets/tFloorOne/tFloorOne.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"$GMRInstanceLayer":"","%Name":"Collide","depth":600,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_231046C3_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_231046C3_1","objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":53.0,"scaleY":1.0,"x":48.0,"y":936.0,},
        {"$GMRInstance":"v1","%Name":"inst_39BD81CF_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_39BD81CF_1","objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":27.000002,"x":48.0,"y":216.0,},
        {"$GMRInstance":"v1","%Name":"inst_656C75BA","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_656C75BA","objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":28.0,"x":1296.0,"y":216.0,},
        {"$GMRInstance":"v1","%Name":"inst_43C9FDBF","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_43C9FDBF","objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":52.32051,"scaleY":1.0,"x":48.0,"y":216.0,},
        {"$GMRInstance":"v1","%Name":"inst_6FFC5FA0","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_6FFC5FA0","objectId":{"name":"oRoomDetect","path":"objects/oRoomDetect/oRoomDetect.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oRoomDetect","path":"objects/oRoomDetect/oRoomDetect.yy",},"propertyId":{"name":"midOverride","path":"objects/oRoomDetect/oRoomDetect.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":51.999996,"scaleY":30.0,"x":682.0,"y":586.0,},
        {"$GMRInstance":"v1","%Name":"inst_527B5F54","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_527B5F54","objectId":{"name":"oRoomMiddle","path":"objects/oRoomMiddle/oRoomMiddle.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":528.0,"y":504.0,},
        {"$GMRInstance":"v1","%Name":"inst_514B1AD8","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_514B1AD8","objectId":{"name":"oBossDracula","path":"objects/oBossDracula/oBossDracula.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":984.0,"y":696.0,},
      ],"layers":[],"name":"Collide","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":700,"effectEnabled":true,"effectType":"_filter_tintfilter","gridX":12,"gridY":12,"hierarchyFrozen":false,"hspeed":0.4,"htiled":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[
        {"name":"g_TintCol","type":1,"value":"#FFA38A8C",},
      ],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":{"name":"sBrickWall","path":"sprites/sBrickWall/sBrickWall.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.4,"vtiled":true,"x":0,"y":0,},
  ],
  "name":"rTest5",
  "parent":{
    "name":"Test Rooms",
    "path":"folders/Rooms/Test Rooms.yy",
  },
  "parentRoom":null,
  "physicsSettings":{
    "inheritPhysicsSettings":false,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":1000,
    "inheritRoomSettings":false,
    "persistent":false,
    "Width":1350,
  },
  "sequenceId":null,
  "views":[
    {"hborder":500,"hport":1080,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":500,"visible":true,"vspeed":-1,"wport":1920,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":true,
    "inheritViewSettings":false,
  },
  "volume":1.0,
}