/// @desc parent_enemyがとある地点まで移動する。
/// @param cx checkpoint_x
/// @param cy checkpoint_y
/// @param return_ai
// stepイベント内で実行する場合、一度だけ実行するためのチェック変数が必要

var cx = argument0;
var cy = argument1;
var return_ai = argument2;

//パスのポイントが一個もないなら、ポイントを定義
if(path_get_number(checking_path) == 0)
{
	point_memory_x = cx;
	point_memory_y = cy;
	checking_path = path_add();
	mp_grid_path(obj_sys_tracer.grid, checking_path, x, y, cx, cy, true);
	path_start(checking_path,walk_speed,path_action_stop,false);
}

//パスの終端まで到達したら、パスをクリア
if(path_position == 1)
{
	ai_mode = return_ai;
	path_clear_points(checking_path);
}



//目標地点を見据える 動かんぞ
//direction = point_direction(x, (y - eye_y), point_memory_x, point_memory_y);