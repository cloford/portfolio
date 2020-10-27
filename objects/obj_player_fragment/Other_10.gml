/// @description init

if(slot_item_id != 0)
{
	e_sprite = asset_get_index(obj_sys_manager.file_csv_item[# 2, slot_item_id]);

	e_xscale = sprite_width / sprite_get_width(e_sprite);
	e_yscale = sprite_height / sprite_get_height(e_sprite);
}