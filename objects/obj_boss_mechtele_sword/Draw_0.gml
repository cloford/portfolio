/// @description 警告と弾の描写

if(check_fire == false) //警告
{
	alert_alpha = 1 - (cast_count / cast_time);
	draw_sprite_ext(sprite_index,0,x,y,1,1,direction,c_white,alert_alpha);
}
else	//実弾描写
{
	draw_self();
}