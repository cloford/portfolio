///@desc プレイヤーに周辺視界を与える（＝周囲以外暗くする）だけ

target_shader = sh_player_light;

uni_resolution	= shader_get_uniform(target_shader, "u_resolution");
uni_p			= shader_get_uniform(target_shader, "u_p");
uni_time		= shader_get_uniform(target_shader, "u_time");

count = 0;
count_rate = 0.01;

shade_surf = noone;