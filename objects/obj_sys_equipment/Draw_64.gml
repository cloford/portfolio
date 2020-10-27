
if(init_end == false) return;

#region //装備の描画

//memo : sprite_create_from_surfaceの後の行で、surfaceに変更を加えることができないみたい。
//なので、sprite_create_from_surfaceは最後にまとめてやる。

//サーフェイスを作成
if (!surface_exists(equipment_surf))
{
	equipment_surf = surface_create(slot_size,slot_size * 9);
	surface_set_target(equipment_surf);
	draw_clear(global.color_ui_dg);
	draw_sprite(spr_equip_mask, 0, 0, 0);
	
	//アイテムスプライトをサーフェイスに描画
	for (var i = 0; i < slot_height; i += 1)
	{
		var sp_y = slot_size + (slot_size * i);
		if(equipment_slot[i] != 0)
		{
			var eq_spr = asset_get_index(obj_sys_manager.file_csv_item[# 2,equipment_slot[i]]);
			var xscale = min(1, (slot_size / sprite_get_width(eq_spr)));
			var yscale = min(xscale,1, (slot_size / sprite_get_height(eq_spr)));
			xscale = min(xscale,yscale,1);
			if(xscale == 1) var offset = 16; else offset = 0;
			draw_sprite_ext(eq_spr, 0, offset, sp_y + offset, xscale, yscale, 0, c_white, 1);
		}
	}
	
	//サーフェイスからスプライトを生成
	//マスクスプライト
	mask_spr = sprite_create_from_surface(equipment_surf, 0, 0, slot_size, slot_size, false, false, 0, 0);
	//アイテムスプライトをマスクして生成
	for (var i = 0; i < slot_height; i += 1)
	{
		var sp_y = slot_size + (slot_size * i);
		gen_spr[i] = sprite_create_from_surface(equipment_surf, 0, sp_y, slot_size, slot_size, false, false, slot_radius, slot_radius);
		sprite_set_alpha_from_sprite(gen_spr[i],mask_spr);
	}
	surface_reset_target();
}

var iy = 0;
var ix = slot_x_int;

//装備と装備枠を描画
for (var i = 0; i < slot_height; i += 1)
{
	draw_sprite(gen_spr[i],		0, x_buffer + ix, y_buffer + (iy * slot_y_int));
	draw_sprite(spr_equip_slot, 0, x_buffer + ix, y_buffer + (iy * slot_y_int));
	iy += 1;
	ix *= -1;
}

#endregion

#region //選択時効果

if(mode_drag == true)
{
	drag_alpha = 0.5;
}
else
{
	drag_alpha = 1;
}

//選択時白く
if(select_equip != -1)
{
	draw_set_alpha(0.5);
	draw_set_color(c_white);
	
	var ix = slot_x_int;
	if((select_equip % 2) == 1) ix *= -1;
	//白い円を描くが、スプライトと同じ計算式では右下に1pixelずれる。原点位置が微妙に違う？
	//（スプライトは96なら原点48だが、サークルは49になっている？）
	draw_circle(x_buffer + ix -1, y_buffer + ((select_equip) * slot_y_int) -1, slot_radius, false);
	draw_set_color(c_white);
	draw_set_alpha (1);
}

#endregion

//debug
draw_set_color(c_white);
if(position_left == true) draw_text(100,100,select_equip);
else draw_text(200,100,select_equip);
draw_set_color(c_white);