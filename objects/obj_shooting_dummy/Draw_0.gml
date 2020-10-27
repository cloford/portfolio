/// @description Insert description here
// You can write your code in this editor

draw_self();
var col = make_color_rgb(damage,0,0)
draw_set_color(col);
draw_circle(x,y,64 * image_xscale,false);
draw_set_color(c_white);
draw_text(x,y,damage);