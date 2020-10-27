///@desc 聴覚AI：look
///@param look_x
///@param look_y
///@param return_ai

//音のした方向に視線を向けるだけ

var look_x		= argument0;
var look_y		= argument1;
var return_ai	= argument2;

path_clear_points(path_index);
path_end();

var lookdir = point_direction(x, (y - eye_y), look_x, look_y);
var lookdiff = angle_difference(lookdir, neck_direction);
neck_direction += (min(abs(lookdiff / 10), 10) * sign(lookdiff));
if(abs(lookdiff) < 1)
{
	ai_mode = return_ai; //ai_modeを変更
	path_clear_points(checking_path);
	hearing = 0;
}