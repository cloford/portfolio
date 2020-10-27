if(variable_instance_exists(id, "count") == false) count = 0;
count += count_rate; // timeカウント

shader_set(target_shader);

shader_set_uniform_f(uni_time, real(count)); //timeを送る。0.02でもまぁ早い
shader_set_uniform_f(uni_resolution, real(global.gui_w), real(global.gui_h)); //画面解像度vec2縦横

draw_surface(application_surface, 0, 0);
//draw_self();
shader_reset();




/*
///draw_gui
if(variable_instance_exists(id, "count") == false) count = 0;
count += count_rate; // timeカウント

if (surface_exists(shade_surf) == false)
{
	shade_surf = surface_create(global.gui_w, global.gui_h);
}

//サーフェイスを塗りつぶす
/*
surface_set_target(shade_surf);
draw_clear_alpha(c_black, 1);
surface_reset_target();
*
shader_set(target_shader);
//gpu_set_blendmode_ext(bm_dest_color, bm_zero);
//gpu_set_blendmode(bm_normal);


//uniform変数をshaderへ送る
shader_set_uniform_f(uni_time, count); //timeを送る。0.02でもまぁ早い
shader_set_uniform_f(uni_resolution_w, global.gui_w); //画面幅
shader_set_uniform_f(uni_resolution_h, global.gui_h); //画面高さ
/*
//点pの位置。ただしmacの場合は上下座標を反転。
if(os_type == os_macosx)
{
	shader_set_uniform_f(uni_p, obj_player.display_x ,global.gui_h - (obj_player.display_y)); //mac
}
else
{
	shader_set_uniform_f(uni_p, obj_player.display_x ,obj_player.display_y); //not mac
}
*
draw_surface(shade_surf, 0, 0);

shader_reset();
*/