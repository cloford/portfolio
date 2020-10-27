/// @description 初期化

init_end = true;

//インベントリGUIの位置
if(position_left == true)	//-------左側に生成するとき（playerのinventoryの場合）
{
	inv_gui_buffer_x	= 284;
	inv_gui_buffer_y	= 315;
}
else						//-------右側に生成するとき
{
	inv_gui_buffer_x	= 1059;
	inv_gui_buffer_y	= 315;
}

#region //inventory

inv_width			= creator.inv_width;
inv_height			= creator.inv_height;
inventory			= creator.inventory;
inventory_amount	= creator.inventory_amount;
inventory_lump[0,0] = 0; //アイテム一個一個を個別の塊とみなすための変数。scr_inventory_initで登録される。

//インベントリ枠のdrawサイズ
inv_gui_width	= 577;
if(creator.has_equip == false) inv_gui_width += (global.inv_box_size * 3)
inv_gui_height	= 705;

//インベントリ選択中のitem id
select_id = 0;

//インベントリの選択中のスロット位置
//-2:枠外 -1:枠内、スロット外　0以上:スロット内
select_inv_x	= -2;
select_inv_y	= -2;
//インベントリの選択中のアイテムサイズ
select_inv_w	= 1;
select_inv_h	= 1;
	
cursor_sprite = spr_mouse_inv;
scr_inventory_init();

#endregion

#region //描画関係

inv_box_size = global.inv_box_size; //マスサイズ

#endregion