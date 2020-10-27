/// @description 

//スキルインターフェース
for (var i = 0; i < slot_height; i += 1)
{
	//装備種に応じて色を決定
	var col;
	if(equip_type[i] = "rifle")			col = c_red;
	else if(equip_type[i] = "shield")	col = c_blue;
	else if(equip_type[i] = "active")	col = c_yellow; 
	else col = c_white;
	
	//アクティブ状態に応じて透明度を決定
	var ia;
	if(active_type[i] ="toggle_d")		ia = 0.3;
	else if(active_type[i] ="hand")		ia = 0.5;
	else								ia = 1;
	
	//ハンドスロットはalpha1
	if(i == holding_slot) ia = 1;
	
	//クールダウンを表現
	var ocol = c_white;
	var ioa = 1 - (cooldown[i,1] / cooldown[i,0]);
	
	draw_set_alpha(ia);
	draw_circle_color(32 + (i*20), 1080-32, 8, col, col, false);
	draw_set_alpha(ioa)
	draw_circle_color(32 + (i*20), 1080-32, 8, ocol, ocol, true);
	draw_set_alpha(1);
}

//debug
for(var i = 0; i < slot_height; i += 1)
{
	draw_text(500,20*i,equipment_slot[i]);
	draw_text(1700,120 + (i * 20), string(active_type[i]));
}
draw_text(1700, 60, energy);
draw_text(1700, 80, holding_slot);
draw_text(1700,300, display_x);
draw_text(1700,320, display_y);

//死亡画面
if(dead == true)
{
	draw_sprite(spr_gameover, 0, global.gui_w / 2, global.gui_h / 2);
	draw_set_halign(fa_center);
	draw_text(global.gui_w / 2, (global.gui_h / 2) + 80, "Press ENTER. return HIDEOUT");
	draw_set_halign(fa_left);
}