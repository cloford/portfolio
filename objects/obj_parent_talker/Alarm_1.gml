///@desc テキストボックス削除

myTextbox = noone;

if(instance_exists(obj_player))
{
	obj_player.hascontrol = true;
}

if (destroy_self)
{
	instance_destroy();
}