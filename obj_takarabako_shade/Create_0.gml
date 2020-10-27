/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

creator = noone;
has_equip = false; //equipを持ってるか

#region //inventory
inv_width	= 4; //インベントリサイズ　横
inv_height	= 4; //インベントリサイズ　縦

//インベントリ 0init(ID)
var inv_x = 0;
var inv_y = 0;

while((inv_y >= inv_height) == false)
{
	inventory[inv_x,inv_y] = 0;			//itemID init
	inventory_amount[inv_x,inv_y] = 1;	//amount init
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}
#endregion

#region //equipment
slot_height = 8; //装備スロットの数。基本的に8。

for (var i = 0; i < slot_height; i += 1)
{
	equipment_slot[i]	= 0;
	slot_update[i]		= false; //装備の更新許可
}
#endregion

#region inventory中身
inventory[0,0] = 51;
inventory[1,0] = 11;
inventory[2,1] = 17;
#endregion