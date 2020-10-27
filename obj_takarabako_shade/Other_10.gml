/// @description インベントリ実体生成

with(instance_create_layer(global.outer_world,global.outer_world,"lay_inventory",obj_sys_inventory))
{
	//基本的なこと
	creator				= other.id;
	position_left		= false;
	event_user(0);
}

