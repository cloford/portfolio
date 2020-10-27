//引数はobject ID、戻り値はなし
//inventory変数とinventory_amount変数をds_gridにstringで格納

//inventoryをds_gridに格納
var inv_x = 0;
var inv_y = 0;

ds_inv = ds_grid_create(argument0.inv_width,argument0.inv_height)

while ((inv_y >= argument0.inv_height) == false)
{	
	ds_grid_add(ds_inv,inv_x,inv_y,argument0.inventory[inv_x,inv_y])
	inv_x += 1;
	if(inv_x >= argument0.inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

//inventory_amountをds_gridに格納
var inv_x = 0;
var inv_y = 0;

ds_inv_amount = ds_grid_create(argument0.inv_width,argument0.inv_height)

while ((inv_y >= argument0.inv_height) == false)
{	
	ds_grid_add(ds_inv_amount,inv_x,inv_y,argument0.inventory_amount[inv_x,inv_y])
	inv_x += 1;
	if(inv_x >= argument0.inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

ini_open("savedata.ini"); //openでファイルを指定
ini_write_string("hideout", "inventory", ds_grid_write(ds_inv));
ini_write_string("hideout", "inventory_amount", ds_grid_write(ds_inv_amount));
ini_close(); //閉じないとメモリリーク
	
ds_grid_destroy(ds_inv);
ds_grid_destroy(ds_inv_amount);