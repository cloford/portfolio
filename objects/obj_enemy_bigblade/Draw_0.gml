/// @description

#region ai_modeに応じてimage_index変更

if (ai_mode == 20)//かまえモード
{
	image_index = 1;
}
else
{
	image_index = 0;//通常時の色
}
if(ai_mode == 51)//かまえモード解除
{
	image_index = 2;
}

#endregion

#region //視界の描画 debug

// 視界範囲の右側を線分で描画
var dx1 = lengthdir_x(view_distance, neck_direction - view_angle);
var dy1 = lengthdir_y(view_distance, neck_direction- view_angle);
draw_line_colour(x, y - eye_y, x+dx1, y - eye_y+dy1, col, col);

// 視界範囲の左側を線分で描画
var dx2 = lengthdir_x(view_distance, neck_direction + view_angle);
var dy2 = lengthdir_y(view_distance, neck_direction + view_angle);
draw_line_colour(x, y - eye_y, x+dx2, y - eye_y+dy2, col, col);

#endregion
 
scr_draw_passive_shield(); //シールド描画

scr_draw_broken(); //損傷描画

#region パスの描画　debug

if(path_exists(path_index))
{
	draw_set_alpha(0.2);
	draw_path(path_index,x,y,true);
	draw_set_alpha(1);
}

#endregion

draw_text(x,y,ai_mode);


