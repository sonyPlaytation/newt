{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rTutorialNew1",
  "creationCodeFile": "rooms/rParent/RoomCreationCode.gml",
  "inheritCode": true,
  "inheritCreationOrder": true,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_59EB8ECF_3","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
    {"name":"inst_6B7E873E_4","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
    {"name":"inst_6D1E3260_3","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
    {"name":"inst_424B59E3_2","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
    {"name":"inst_39B5FFE7_3","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
    {"name":"inst_1AC5C337_3","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
    {"name":"inst_58F432F0_3","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
    {"name":"inst_61DBD9E1","path":"rooms/rTutorialNew1/rTutorialNew1.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Player","depth":0,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_39B5FFE7_3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oNewt","path":"objects/oNewt/oNewt.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":96.0,"y":504.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Interact","depth":100,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1AC5C337_3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oLockDoor","path":"objects/oLockDoor/oLockDoor.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":96.0,"y":504.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_58F432F0_3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oExitDoor","path":"objects/oExitDoor/oExitDoor.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oExitDoor","path":"objects/oExitDoor/oExitDoor.yy",},"propertyId":{"name":"target","path":"objects/oExitDoor/oExitDoor.yy",},"value":"rTutorialNew",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":864.0,"y":504.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_61DBD9E1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oSign","path":"objects/oSign/oSign.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oSign","path":"objects/oSign/oSign.yy",},"propertyId":{"name":"text","path":"objects/oSign/oSign.yy",},"value":"\"Welcome to the Tutorial!\\nIt's pretty short but should teach you the basics.\\nI highly recommend you read the readme included with your download\\nbecause these signs are not a convenient way to convey information.\"",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":480.0,"y":456.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles","depth":100,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"layers":[],"properties":[],"tiles":{"SerialiseHeight":23,"SerialiseWidth":40,"TileCompressedData":[
-41,0,-38,28,-2,0,1,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,
0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,
4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,
-36,0,4,28,0,0,28,-36,0,4,28,0,0,28,-36,0,3,28,0,0,-38,28,-41,0,],"TileDataFormat":1,},"tilesetId":{"name":"tFloorOne","path":"tilesets/tFloorOne/tFloorOne.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Collide","depth":200,"effectEnabled":true,"effectType":null,"gridX":24,"gridY":24,"hierarchyFrozen":false,"inheritLayerDepth":true,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":false,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_59EB8ECF_3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_59EB8ECF","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":38.0,"scaleY":1.0,"x":24.0,"y":24.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6B7E873E_4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_6B7E873E","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":20.0,"x":24.0,"y":48.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6D1E3260_3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_6D1E3260","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":20.0,"x":912.0,"y":48.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_424B59E3_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":true,"inheritedItemId":{"name":"inst_424B59E3","path":"rooms/rParent/rParent.yy",},"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCollide","path":"objects/oCollide/oCollide.yy",},"properties":[],"rotation":0.0,"scaleX":36.0,"scaleY":1.0,"x":48.0,"y":504.0,},
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
    "Height": 552,
    "inheritRoomSettings": true,
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