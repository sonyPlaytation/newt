{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rTutorialNew6",
  "creationCodeFile": "rooms/rParent/RoomCreationCode.gml",
  "inheritCode": true,
  "inheritCreationOrder": true,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_59EB8ECF_1_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_6B7E873E_2_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_6D1E3260_1_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_39B5FFE7_1_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_1AC5C337_1_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_2024DA11_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_34AD63B3_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_5D11D394_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_62B714F2_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
    {"name":"inst_2E228C23_1","path":"rooms/rTutorialNew6/rTutorialNew6.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Assets_1","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_4F1D43D8","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"spriteId":{"name":"Sprite182","path":"sprites/Sprite182/Sprite182.yy",},"x":322.0,"y":552.0,},
      ],"depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Player","depth":100,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_39B5FFE7_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oNewt","path":"objects/oNewt/oNewt.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":288.0,"y":648.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5D11D394_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oSodaPickup","path":"objects/oSodaPickup/oSodaPickup.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oSodaPickup","path":"objects/oSodaPickup/oSodaPickup.yy",},"propertyId":{"name":"randomWand","path":"objects/oSodaPickup/oSodaPickup.yy",},"value":"False",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oSodaPickup","path":"objects/oSodaPickup/oSodaPickup.yy",},"propertyId":{"name":"weapon","path":"objects/oSodaPickup/oSodaPickup.yy",},"value":"5",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":480.0,"y":624.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Interact","depth":200,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1AC5C337_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oLockDoor","path":"objects/oLockDoor/oLockDoor.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":288.0,"y":648.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_62B714F2_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oSign","path":"objects/oSign/oSign.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oSign","path":"objects/oSign/oSign.yy",},"propertyId":{"name":"text","path":"objects/oSign/oSign.yy",},"value":"\"Damn man... looks like you're stuck...\\nUnless you can find some kind of soda that lets you air dash up to\\ntwo times in the air by pressing Left Shift or Mouse5, I have no idea how you'd get out of this one.\"",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":408.0,"y":600.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2E228C23_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oExitDoor","path":"objects/oExitDoor/oExitDoor.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oExitDoor","path":"objects/oExitDoor/oExitDoor.yy",},"propertyId":{"name":"target","path":"objects/oExitDoor/oExitDoor.yy",},"value":"rTutorialNew4",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":672.0,"y":264.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles","depth":100,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"layers":[],"properties":[],"tiles":{"SerialiseHeight":32,"SerialiseWidth":40,"TileCompressedData":[
-209,0,-22,28,-18,0,1,28,-20,0,1,28,-18,0,1,28,-20,0,1,28,-18,0,1,28,-20,0,1,28,-18,0,1,28,-20,0,1,28,-18,0,1,28,
-20,0,1,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,
-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,
-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-18,0,1,28,-15,0,-6,28,-9,0,-9,-2147483648,1,28,-11,-2147483648,-4,0,-6,28,-18,-2147483648,1,28,-11,-2147483648,-4,0,
-6,28,-18,-2147483648,1,28,-11,-2147483648,-4,0,-6,28,-18,-2147483648,1,28,-11,-2147483648,-4,0,-6,28,-18,-2147483648,-22,28,-169,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tFloorOne","path":"tilesets/tFloorOne/tFloorOne.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Collide","depth":200,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_59EB8ECF_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_59EB8ECF","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":22.0,"scaleY":1.0,"x":216.0,"y":120.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6B7E873E_2_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_6B7E873E","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":22.0,"x":216.0,"y":144.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6D1E3260_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_6D1E3260","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":22.0,"x":720.0,"y":144.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2024DA11_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":5.0,"scaleY":17.0,"x":600.0,"y":264.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_34AD63B3_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_59EB8ECF","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":22.0,"scaleY":1.0,"x":216.0,"y":648.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":30.0,"animationSpeedType":0,"colour":4294967295,"depth":300,"effectEnabled":true,"effectType":"_filter_tintfilter","gridX":24,"gridY":24,"hierarchyFrozen":false,"hspeed":0.2,"htiled":true,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_TintCol","type":1,"value":"#FFA38A8C",},
      ],"spriteId":{"name":"sCollideMiddle","path":"sprites/sCollideMiddle/sCollideMiddle.yy",},"stretch":true,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.2,"vtiled":true,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Tutorial",
    "path": "folders/Rooms/Tutorial.yy",
  },
  "parentRoom": {
    "name": "rParent",
    "path": "rooms/rParent/rParent.yy",
  },
  "physicsSettings": {
    "inheritPhysicsSettings": true,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 750,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 960,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":540,"inherit":false,"objectId":{"name":"oNewt","path":"objects/oNewt/oNewt.yy",},"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":960,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":360,"hspeed":-1,"hview":360,"inherit":true,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":640,"wview":640,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": true,
    "inheritViewSettings": true,
  },
  "volume": 1.0,
}