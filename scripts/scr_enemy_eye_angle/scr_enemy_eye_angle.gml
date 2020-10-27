
///@desc 角度型視覚。視野内のtargetを認知する。
///@param found_ai
///@param return_ai

var found_ai	= argument0;
var return_ai	= argument1;

if(point_distance(x, (y - eye_y), target.x, target.y - (target.sprite_height /2)) <= view_distance)
{
	var x1 = lengthdir_x(1,neck_direction);
	var y1 = lengthdir_y(1,neck_direction);

	var x2 = target.x - x;
	var y2 = target.y - (target.sprite_height /2) - (y - eye_y);

	var dot = dot_product_normalized(x1, y1, x2, y2); //targetへの角度（-1〜1、真正面で1）を割り出す
	if (dot > view_angle_cos)
	{
		var inst = collision_line(x, (y - eye_y), target.x, target.y, obj_wall, false, true);
		if (inst == noone) //playerまでの直線にwallがぶつからないなら
		{
			ai_mode = found_ai; //見えている
			//進行中のパスを消去
			if(path_get_number(checking_path) >= 1) path_clear_points(checking_path);
		}
		else if(ai_mode == found_ai)
		{
			ai_mode = return_ai;
		}
	}
	else if(ai_mode == found_ai)
	{
		ai_mode = return_ai;
	}
}
else if(ai_mode == found_ai)
{
	ai_mode = return_ai;
}
