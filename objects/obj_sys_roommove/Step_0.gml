

#region //部屋移動

if (!blackout)
{
	if (!opened)
	{
		audio_play_sound(se_door_open,50,false);
		opened = true;
	}
	blackout = true;
	alarm[1] = 30
}
else
{
	now_blackalpha += 0.05;
	if (blackend)
	{
		now_blackalpha -= 0.1;
		if (now_blackalpha <= 0) blackout = false;
	}
}


if (close_sound)
{
	audio_play_sound(se_door_close,50,false);
	close_sound = false;
}
#endregion


/*
タイトルコール関連は里見家廊下専用になってたのでコメントアウト
#region //タイトルコール

if (roommove_to == rm_satomi_rouka) && (!obj_sys_flag.located_satomike)
{
	obj_sys_flag.located_satomike = true;
	first_locate = true;
}

if (title_call) && (!blackout)
{
	if (feedout_start)
	{
		now_title_alpha += 0.03
	}

	if (now_title_alpha > 1)
	{
		now_title_alpha = 1;
		feedout_start = false;
		alarm[2] = 60;
	}

	if (feedout_end)
	{
		now_title_alpha -= 0.015
		if (now_title_alpha <= 0)
		{
			alarm[0] = 1;
		}
	}
}
#endregion
*/