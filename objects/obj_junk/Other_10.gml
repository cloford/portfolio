/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//equipment 生成
with(instance_create_layer(global.outer_world,global.outer_world,"lay_inventory",obj_sys_equipment))
{
	//基本的なこと
	creator				= other.id;
	position_left		= false;
	event_user(0);
}

