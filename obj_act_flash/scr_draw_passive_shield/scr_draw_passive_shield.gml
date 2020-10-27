//自動シールド描画 draw上で

if(shield >= 1)
{
	for(var i = 0; i < shield; i += 1)
	{
		draw_set_alpha(0.1);
		draw_set_color(c_white);
		draw_circle(x,y - (sprite_height / 2),shield_radius,false);
		draw_set_alpha(1);
	}
}