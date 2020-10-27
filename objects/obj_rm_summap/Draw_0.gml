/// @description 

if(selected == true)
{
	draw_sprite(sprite_index,0,x,y); //TODO : spriteは移動先roomに応じて変更 10行目も
}
else
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, draw_alpha);
}

//roomの名前を描写
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fnt_text);
draw_set_alpha(draw_alpha);
draw_text(x + (sprite_width / 2),y + sprite_height,room_get_name(roommove_to)); //TODO : 部屋名はちゃんと定義しなきゃならん
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);

if(press_counter > 0)
{
	gpu_set_blendmode_ext(bm_inv_dest_color,bm_zero);
	draw_set_color(c_white);
	draw_rectangle(x,y,x + press_counter,y + sprite_height -1,false);
	gpu_set_blendmode(bm_normal);
}