/// @description Insert description here
// You can write your code in this editor

count += 1;

audio_emitter_position(myemitter, x, y, 0);

if(count >= 60)
{
	scr_sound_save(300, id, "alert",x,y);
	audio_emitter_falloff(myemitter, 50, 600, 1); //音声の距離減衰 id, 減衰開始距離, 最大距離, 係数
	audio_play_sound_on(myemitter, se_excrametion, false, global.se_priority);
	count = 0;
}