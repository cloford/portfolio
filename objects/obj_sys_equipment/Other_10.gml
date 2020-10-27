/// @description 初期化

init_end = true;

//インベントリGUIの位置
if(position_left == true)
{
	x_buffer = 108 + 40;
	slot_x_int = -40;
}
else
{
	x_buffer = 1812 - 40;
	slot_x_int = 40;
}

y_buffer = 360;
slot_y_int = 80;
slot_radius = 48;	//装備スロットのサイズ。半径。
slot_size = 96;		//装備スロットのサイズ。直径。

//equipment var
slot_height		= creator.slot_height;
equipment_slot	= creator.equipment_slot;
slot_update		= creator.slot_update;

//equipmentの操作に必要な変数諸々
select_equip = -1;
mode_drag = false;
drag_ID = 0;

moveto = 0;
move_start = false;

equipment_surf = noone;