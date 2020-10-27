/// @description

#region ai_modeに応じてimage_index変更

if (ai_mode == 50)
{
	image_index = 1;
}
else
{
	image_index = 0;//ロストポイント確認の時だけこの色
}
if(ai_mode == 1)
{
	image_index = 2;
}

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

draw_text(x,y,path_get_number(checking_path));