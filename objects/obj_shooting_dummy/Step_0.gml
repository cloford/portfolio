/// @description Insert description here
// You can write your code in this editor

var inst = instance_place(x,y,obj_parent_bullet)
if(inst != noone) and (inst.creator != id)
{
	inst.touch_actor = id;
	with(inst) event_user(1);//衝突イベントスタート
}