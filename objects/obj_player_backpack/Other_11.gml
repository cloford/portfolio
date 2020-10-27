/// @description playerの装備を更新

if(instance_exists(obj_player) == true)
{
	obj_player.equipment_slot	= equipment_slot;
	obj_player.slot_update		= slot_update;
	with(obj_player) event_user(0);
}