//lumpとspriteを登録。

var inv_x = 0;
var inv_y = 0;

//lumpとspirte 0初期化
while(inv_y < inv_height)
{
	inventory_lump[inv_x,inv_y] = 0;
	inventory_sprite[inv_x,inv_y] = 0;
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

var inv_x = 0;
var inv_y = 0;

while (inv_y < inv_height)
{
	if (inventory[inv_x,inv_y] >= 2) //0は無、1は大型アイテムの左上以外。それ以外の数値はItem IDを示す。
	{
		global.inv_lump_number += 1;
		var tempid = inventory[inv_x,inv_y];
		var item_size_w = real(obj_sys_manager.file_csv_item[# 4,tempid]);
		var item_size_h = real(obj_sys_manager.file_csv_item[# 5,tempid]);
		var temp_sprite = asset_get_index(obj_sys_manager.file_csv_item[# 2,tempid]);
		
		//sprite登録
		inventory_sprite[inv_x,inv_y] = temp_sprite;
		
		var il_x = inv_x;
		var il_y = inv_y;
		var il_w = inv_x + item_size_w;
		var il_h = inv_y + item_size_h;
		
		//lump登録
		while(il_y < il_h)
		{
			inventory_lump[il_x,il_y] = global.inv_lump_number;
			il_x += 1;
			if(il_x >= il_w)
			{
				il_y += 1;
				il_x = inv_x;
			}
		}
	}
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

/* old

var inv_x = 0;
var inv_y = 0;
	
var inv_item_x = 0;
var inv_item_y = 0;
	
while ((inv_y >= inv_height) == false)
{
	if (inventory[inv_x,inv_y] != 0) //0は無、0以外の数値はItem ID
	{
		inv_item_x= inv_gui_buffer_x + global.inv_box_size * inv_x;
		inv_item_y= inv_gui_buffer_y + global.inv_box_size * inv_y;
		myitem = instance_create_layer(inv_item_x,inv_item_y,"lay_inventory_item",obj_item_sumitem);
		myitem.creator = self;
		myitem.birth_x = inv_x;
		myitem.birth_y = inv_y;
		myitem.amount = inventory_amount[inv_x,inv_y];
		myitem.myid = inventory[inv_x,inv_y];
		with(myitem)
		{
			event_user(0);
		}
				
	}
	if (inventory[inv_x,inv_y] = 0) //空きは無で満ちる
	{
		inv_item_x= inv_gui_buffer_x + global.inv_box_size * inv_x;
		inv_item_y= inv_gui_buffer_y + global.inv_box_size * inv_y;
		myitem = instance_create_layer(inv_item_x,inv_item_y,"lay_inventory_item",obj_item_0);
		myitem.creator = self;
		myitem.birth_x = inv_x;
		myitem.birth_y = inv_y;
	}
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

*/