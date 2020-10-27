///@desc 音を保存
///@param dynamics
///@param sender id
///@param sound_type

/*
音を発生するスクリプト
このスクリプトをインスタンスが実行すると、そのフレームでx, y, 音量, 出力者idをすべてのenemyに送る。
*/
dynamics	= argument0;
sender		= argument1;
sound_type	= argument2;
point_x		= argument3;
point_y		= argument4;

//すべてのenemyに音を受信させる。
if(instance_exists(obj_parent_enemy) == true)
{
	obj_parent_enemy.from_sound_point_x		= point_x;
	obj_parent_enemy.from_sound_point_y		= point_y;
	obj_parent_enemy.from_sound_dynamics	= dynamics;
	obj_parent_enemy.from_sound_sender		= sender;
	obj_parent_enemy.from_sound_type		= sound_type;
	obj_parent_enemy.from_sound_team		= team;
}