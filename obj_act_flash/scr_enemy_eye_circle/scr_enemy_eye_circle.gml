///@desc eyesight 円型 view_distance内のすべてを検知
///@param found_ai
///@param return_ai

var found_ai	= argument0;
var return_ai	= argument1;

if(point_distance(x, (y - eye_y), target.x, target.y - (target.sprite_height /2)) <= view_distance)
{
	ai_mode = found_ai;
	if(path_get_number(checking_path) >= 1) path_clear_points(checking_path);
}
else
{
	ai_mode = return_ai;
}