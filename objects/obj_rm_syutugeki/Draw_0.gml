/// @description 

if(selected == true)
{
	draw_sprite(sprite_index,0,x,y); //TODO : spriteは移動先roomに応じて変更
}
else
{
	draw_set_alpha(draw_alpha);
	draw_sprite(sprite_index,0,x,y);
	draw_set_alpha(1);
}

if(press_counter > 0)
{
	gpu_set_blendmode_ext(bm_inv_dest_color,bm_zero);
	draw_set_color(c_white);
	draw_rectangle(x,y,x + press_counter,y + sprite_height -1,false);
	gpu_set_blendmode(bm_normal);
}