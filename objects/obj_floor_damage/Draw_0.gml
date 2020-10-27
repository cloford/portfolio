var vc = 255-(count/count_cap*255);
var col = make_color_rgb(255,vc,vc);
draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,0,col,1);


