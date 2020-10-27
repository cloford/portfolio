/// @description インベントリ実体生成

if(in_shop == true) return; //shop内ならインベントリは展開しない。

//inventory 生成
with(instance_create_layer(global.outer_world,global.outer_world,"lay_inventory",obj_sys_inventory))
{
	//基本的なこと
	creator				= other.id;
	position_left		= true;
	event_user(0);
}

//equipment 生成
with(instance_create_layer(global.outer_world,global.outer_world,"lay_inventory",obj_sys_equipment))
{
	//基本的なこと
	creator				= other.id;
	position_left		= true;
	event_user(0);
}

