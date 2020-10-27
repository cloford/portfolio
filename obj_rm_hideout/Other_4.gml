/// @desc load, layer, open

if(room == (rm_shop) or (room == rm_sellshop))
{
	in_shop = true;
}

scr_load_inventory(self);

if(layer_exists("lay_inventory") == false)
{
	layer_create(-110,"lay_inventory");
}

ini_open("savedata.ini");
money = ini_read_real("hideout","money",0); //適当な変数にiniの指定した値を格納。realは数字
ini_close(); //閉じないとメモリリーク

//inventory open
if(in_shop == false)
{
	event_user(0);
	with(obj_player_backpack) event_user(0);
}