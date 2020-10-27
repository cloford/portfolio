scr_tracer(obj_player.x,obj_player.y,5)
if(place_meeting(x,y,obj_player) != true)//対象に重なっていなければ
{
	if(audio_is_playing(se_foot) != true)//音が鳴っていなければ
	{
		audio_play_sound(se_foot,1,false);//音を再生する
		hear_sound = 1;
	}
}
else//対象に重なっているならば
{
	audio_stop_sound(se_foot);//現在再生されている音を停止する
	hear_sound = 0;
}

