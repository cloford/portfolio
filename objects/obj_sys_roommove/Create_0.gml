//@desc room移動に関するシステム。しかし……

//TODO : obj_playerとかに依存しすぎ（変数化させなければ）

preroom = 128;
roommove_to = noone;

//feedout_start = true;
feedout_end = false;
//now_title_alpha = 0;

blackout = false;
blackend = false;
now_blackalpha = 0;

title_call = false;
close_sound = false;

first_locate = false;

if (instance_exists(obj_player))
{
	obj_player.hascontrol = false;
}
opened = false;
