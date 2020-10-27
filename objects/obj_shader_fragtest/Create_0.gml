///create

target_shader = sh_fragtest;

uni_resolution		= shader_get_uniform(target_shader, "u_resolution");
uni_p				= shader_get_uniform(target_shader, "u_p");
uni_time			= shader_get_uniform(target_shader, "u_time");

count = 0;
count_rate = 0.01;

shade_surf = noone;

application_surface_draw_enable(false);