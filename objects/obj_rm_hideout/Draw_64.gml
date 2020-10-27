if(in_shop == true) return;

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text((window_get_width()/2),(window_get_height()/2 + 64),"money : " + string(money));
draw_set_halign(fa_left);