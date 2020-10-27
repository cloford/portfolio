/// @description

#region walk_animation

if(path_get_number(checking_path) >= 1)
{
	//walk_count割る15の商（1～14）
	//round（上の結果 / 15）で四捨五入（＝ 0.06667～0.93333 -> 0～1）
	walk_count += 1;
	var walkimg = round((walk_count % 15) / 15);
	image_index = walkimg;
}
else
{
	image_index = 0;
}

#endregion

#region パスの描画　debug

if(path_exists(path_index))
{
	draw_set_alpha(0.2);
	draw_path(path_index,x,y,true);
	draw_set_alpha(1);
}

#endregion

draw_text(x,y,path_get_number(checking_path));