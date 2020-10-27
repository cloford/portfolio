/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_down))
{
	menu_cursor ++;
	if (menu_cursor >= room_list_items)
	{
		menu_cursor = 0;
	}
}


if (keyboard_check_pressed(vk_up))
{
	menu_cursor --;
	if (menu_cursor < 0)
	{
		menu_cursor = room_list_items - 1;
	}
}

if (keyboard_check(vk_enter))
{
	if(room_list[menu_cursor] == "quit") 
	{
		game_end();
		return;
	}
	room_goto(asset_get_index(room_list[menu_cursor]));
}