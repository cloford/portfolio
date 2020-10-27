/// @description インベントリを開く／宝箱を開く

open_inventory = true;
with(obj_player_backpack) event_user(0);

if(intract_to != noone)
{
	with(intract_to) event_user(0);
}