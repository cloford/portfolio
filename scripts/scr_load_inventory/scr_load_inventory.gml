//引数はobject ID
//savedata.iniからds_gridを読み込み、変数に展開。
//必要な変数は
//inv_width
//inv_height
//inventory[0,0]
//inventory_amount[0,0]

ini_open("savedata.ini");

ds_inv = ds_grid_create(argument0.inv_width,argument0.inv_height);
ds_grid_read(ds_inv, ini_read_string("hideout", "inventory", ""));
		
var inv_x = 0;
var inv_y = 0;

while ((inv_y >= argument0.inv_height) == false)
{	
	argument0.inventory[inv_x,inv_y] = real(ds_grid_get(ds_inv,inv_x,inv_y));
	inv_x += 1;
	if(inv_x >= argument0.inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

ds_inv_amount = ds_grid_create(argument0.inv_width,argument0.inv_height);
ds_grid_read(ds_inv_amount, ini_read_string("hideout", "inventory_amount", ""));
		
var inv_x = 0;
var inv_y = 0;

while ((inv_y >= argument0.inv_height) == false)
{	
	argument0.inventory_amount[inv_x,inv_y] = real(ds_grid_get(ds_inv_amount,inv_x,inv_y));
	inv_x += 1;
	if(inv_x >= argument0.inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

ini_close(); //閉じないとメモリリーク
	
ds_grid_destroy(ds_inv);
ds_grid_destroy(ds_inv_amount);