/// @description Insert description here
// You can write your code in this editor


start_music = true;
bgm = noone;

switch (room) //今のroomに応じて曲を再生する……いずれ消す。
{
	case (rm_debug_old): bgm = bgm_cafe_arkham; break;
	case (rm_debug): bgm = bgm_tenbou; break;
}


if (start_music)
{
	audio_stop_all();
	audio_play_sound(bgm,10,true);
	start_music = false;
}
/*TODO:
同じBGMならBGMを停止せずそのまま続ける
roomではなく状況などでも変化する変数に。
*/