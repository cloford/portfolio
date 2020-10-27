/// @description destroy_self
if (instance_exists(obj_player))
{
	obj_player.hascontrol = true;
}
instance_destroy();