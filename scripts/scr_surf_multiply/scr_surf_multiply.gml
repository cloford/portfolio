/// @desc 二つのサーフェイスを乗算合成。Draw_GUIなどで使う。
/// @param cs composit surf
/// @param ts target surf

var cs = argument0;
var ts = argument1;

//変数定義済みかをチェック
if(variable_instance_exists(id, "uni_sampler") == false)
{
	uni_sampler	= shader_get_sampler_index	(sh_surf_multiply, "u_sampler");
}
if(variable_instance_exists(id, "uni_ratio") == false)
{
	uni_ratio	= shader_get_sampler_index	(sh_surf_multiply, "u_ratio");
}

//合成用サーフェイスをテクスチャに変換（2枚まで！）
var surf_tex = surface_get_texture(cs);

//シェーダに変数などを送る
shader_set(sh_surf_multiply);

//surf_tex（合成用サーフェイスをテクスチャにしたもの）を送る
texture_set_stage(uni_sampler, surf_tex);	
shader_set_uniform_f(uni_ratio, 1.0);
draw_surface(ts, 0, 0); //appを描画
shader_reset();

//debug
if(keyboard_check(vk_enter)) 
{
	draw_surface(cs, 64, 64);
	draw_text(0,0, texture_get_width(surf_tex))
	draw_text(0,20, surface_get_width(cs))
}

