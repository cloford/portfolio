
if (blackout)
{
draw_set_alpha(now_blackalpha);
draw_set_color(c_black)
draw_rectangle(0,0,window_get_width(),window_get_height(),false)
draw_set_alpha(1);
}


/*  タイトルコール関係
if (title_call)
{
draw_set_alpha(now_title_alpha);
draw_sprite(spr_title_satomike,0,window_get_width()/2,window_get_height()/2);
}
*/