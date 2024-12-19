/// @description

var json_rooms = roomCollection(); // generated from rooms starting with rt_

room_pack_load_map(json_rooms[? "rTest3"],0,0);
room_pack_load_map(json_rooms[? "rTestBasic"],1300,0);

ds_map_destroy(json_rooms);