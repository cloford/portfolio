//旧equip draw。捨てる。

//argument0 左か右か。左ならtrue
//equipment_slotが必要
//TODO GUI変倍対応


if(argument0 == true)
{
	var x_buffer = 108 + 40;
	var slot_x_int = -40;
}
else
{
	var x_buffer = 1812 - 40;
	var slot_x_int = 40;
}

var y_buffer = 360;
var slot_y_int = 80;

var iy = 0;
var ix = slot_x_int;

//装備枠を描画
for (var i = 0; i < slot_height; i += 1)
{
	draw_sprite(spr_inv_equipslot,0,x_buffer + ix, y_buffer + (iy * slot_y_int));
	iy += 1;
	ix *= -1;
}

//mask surfaceがないなら作成
if (!surface_exists(mask_surface)) 
{
	mask_surface = surface_create(global.gui_w, global.gui_h);
}
	//マスク描画準備
	surface_set_target(mask_surface);
	draw_clear(c_black);
	gpu_set_blendmode(bm_subtract);
	//ここで描画されるものによって下で実行されるものをマスクする。
	var iy = 0;
	var ix = slot_x_int;
	for (var i = 0; i < slot_height; i += 1)
	{
		draw_sprite(spr_equip_mask,0,x_buffer + ix, y_buffer + (iy * slot_y_int));
		iy += 1;
		ix *= -1;
	}
	//reset
	gpu_set_blendmode(bm_normal);
	surface_reset_target();




//clip_surfaceがないなら作成
if (!surface_exists(clip_surface)) 
{
	// create the clip-surface, if needed
	clip_surface = surface_create(global.gui_w, global.gui_h);
}

// 描画準備
surface_set_target(clip_surface);
draw_clear_alpha(c_black, 0);

// ここに描画する実体を記す
var iy = 0;
var ix = slot_x_int;
for (var i = 0; i < slot_height; i += 1)
{
	if(equipment_slot[i] != 0)
	{
		var eq_spr = asset_get_index(obj_sys_manager.file_csv_item[# 2,equipment_slot[i]]);
		var xscale = min(1, (96 / sprite_get_width(spr_test_gradient)));
		var yscale = min(xscale,1, (96 / sprite_get_height(spr_test_gradient)));
		xscale = min(xscale,yscale,1);	
		draw_sprite_ext(eq_spr, 0, x_buffer + ix -49,y_buffer + (iy * slot_y_int) -49, xscale, yscale, 0, c_white, 1);
	}
	iy += 1;
	ix *= -1;
}
// cut out the mask-surface from it:
gpu_set_blendmode(bm_subtract);
draw_surface(mask_surface, 0, 0);
gpu_set_blendmode(bm_normal);
// finish and draw the clip-surface itself:
surface_reset_target();
draw_surface(clip_surface, 0, 0);