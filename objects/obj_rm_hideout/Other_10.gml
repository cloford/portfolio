/// @description インベントリ実体生成

with(instance_create_layer(x,y,"lay_inventory",obj_sys_inventory))
{
	//基本的なこと
	creator				= other.id;
	position_left		= false;
	event_user(0);
}

