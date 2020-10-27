///@desc scr_sound_load(hearing_power)

/*
引数：聴力
戻り値：聞こえた音量
*/

//ガード節
//発信者無し、発信者と受信者が同一、発信者と受信者のobjectが同種の場合return 0
if(from_sound_sender == noone) or (from_sound_team == team)
{
	from_sound_dynamics = 0;
	from_sound_sender = noone;
	return 0;
}

var dist = distance_to_point(from_sound_point_x,from_sound_point_y);//音が出たオブジェクトからの距離
var volume = (from_sound_dynamics * argument0) - dist; //聞こえた音量　＝　(音量 * 聴力) - 距離
from_sound_dynamics = 0;
from_sound_sender = noone;
return volume;

//TODO : player側では、音源によって再生する音を変える。銃声ならse_gunfire、足音ならse_footstepなどを。