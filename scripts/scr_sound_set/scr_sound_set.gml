/*

argument0には鳴らしたい音を入れる
ループしない、音は重ならない

*/

if(audio_is_playing(argument0) != true)//指定の音が鳴っていなければ
{
	audio_play_sound(argument0,false,false);//指定の音を再生する
}