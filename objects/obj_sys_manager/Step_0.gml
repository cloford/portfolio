/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_alt)) and (keyboard_check_pressed(ord("O")))
{
	audio_play_sound(se_door_open,50,false);
	if(window_get_fullscreen() == true)
	{
		window_set_fullscreen(false);
	}
	else 
	{
		window_set_fullscreen(true);
	}
}