///@desc アイドルAI：うろうろ
//適当な地点を選び、そこまで移動する

//パスポイントが一個もないなら
if(path_get_number(checking_path) == 0)
{
	//目的地を設定（ランダムな空いているポイント）
	
	do
	{
		var next_move_point_x = irandom(obj_area_set1);
		var next_move_point_y = irandom(obj_area_set1);
	}
	until place_empty(next_move_point_x,next_move_point_y,obj_wall);
	
	//パスを作成・実行
	scr_enemy_check_to_point(next_move_point_x,next_move_point_y, 1);
}
//終端に到着したらポイントを削除する。
if(path_position == 1)
{
	path_clear_points(checking_path);
}