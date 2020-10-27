/// @description

money = 0; //お金
 
creator = noone;
has_equip = false; //equipを持ってるか
in_shop = false;


#region //inventory
inv_width	= 8; //インベントリサイズ　横
inv_height	= 8; //インベントリサイズ　縦

//インベントリ 0init(ID)
var inv_x = 0;
var inv_y = 0;

while((inv_y >= inv_height) == false)
{
	inventory[inv_x,inv_y] = 0;				//itemID init
	inventory_amount[inv_x,inv_y] = 1;		//amount init
	inventory_buy[inv_x, inv_y] = false;	//購入予約フラグ init
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




