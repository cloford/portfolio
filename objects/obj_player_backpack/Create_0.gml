/// @description プレイヤーのインベントリ。
//所持品のIDと数、および装備品の数を記録するだけ。
//プレイヤーがいないところでも生きている

creator = obj_player;
//isopen = false; //開いてるか
in_shop = false; //shop内か
has_equip = true;

#region //inventory

inv_width	= 4; //インベントリサイズ　横
inv_height	= 4; //インベントリサイズ　縦

#region//0init
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

#endregion



#region //equipment

slot_height = 8; //装備スロットの数。基本的に8。

#region //0init
for (var i = 0; i < slot_height; i += 1)
{
	equipment_slot[i]	= 0;
	slot_update[i]		= false; //装備の更新許可
}
#endregion

#endregion



//スロットの手動登録（debug）

inventory[0,0] = 72;
inventory[1,0] = 1;

inventory[0,1] = 52;
inventory[0,2] = 1;

inventory[2,1] = 73;

inventory[2,2] = 12;
inventory[3,2] = 1;
inventory[2,3] = 1;
inventory[3,3] = 1;

equipment_slot[0] = 71;
equipment_slot[1] = 51;
equipment_slot[2] = 91;