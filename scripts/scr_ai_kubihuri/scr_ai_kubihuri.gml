///@desc 首を振る動作をする。
///@param return_ai

var return_ai = argument0; //首振り終了時に戻るai_mode

if(check_flag == false)//終端まで移動したときの角度を記録する
{
	check_flag = true;
	set_direction = neck_direction;
}
if(count < neck_speed)
{
	neck_direction -= turning_around/neck_speed;
	count ++;
}
if(count >= neck_speed)
{
	neck_direction += turning_around/neck_speed;
	count ++;
}

if(count == neck_speed * 3)	//左右の確認が終わった
{
	check_flag = false;
	count = 0;
	path_clear_points(checking_path);//確認したパスを削除する
	ai_mode = return_ai;
}
