/// @description save

instance_destroy(obj_sys_inventory);
instance_destroy(obj_sys_equipment);

scr_save_inventory(self);

ini_open("savedata.ini"); //openでファイルを指定
ini_write_real("hideout", "money", money);
ini_close(); //閉じないとメモリリーク