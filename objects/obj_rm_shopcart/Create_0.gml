/// @description inventory_create + cart固有の初期化

// Inherit the parent event
event_inherited();

///@desc init

creator = obj_rm_hideout;
has_equip = false; //equipを持ってるか
position_left = false;

inv_width			= obj_rm_hideout.inv_width; //インベントリサイズ　横 hideoutと同じ
inv_height			= obj_rm_hideout.inv_height; //インベントリサイズ　縦

#region //inventory 0 init
inv_width	= 8; //インベントリサイズ　横
inv_height	= 8; //インベントリサイズ　縦

//インベントリ 0init(ID)
var inv_x = 0;
var inv_y = 0;

while((inv_y >= inv_height) == false)
{
	inventory[inv_x, inv_y] = 0;			//itemID init
	inventory_amount[inv_x, inv_y] = 1;		//amount init
	inventory_buy[inv_x, inv_y] = false;	//buyflag init
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}
#endregion

inventory			= obj_rm_hideout.inventory;
inventory_amount	= obj_rm_hideout.inventory_amount;

if(room == rm_sellshop) moveto = obj_rm_sellshop;