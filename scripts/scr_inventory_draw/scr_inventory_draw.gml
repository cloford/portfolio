//インベントリを開く
//draw_gui上で動作
//TODO : イチイチvarで色宣言してるけど、argumentにすべきか。

draw_set_alpha(1);
var col = $181818;
draw_set_color(col);
var ix2 = inv_gui_buffer_x + inv_gui_width;
var iy2 = inv_gui_buffer_y + inv_gui_height;
draw_rectangle(inv_gui_buffer_x,inv_gui_buffer_y,ix2,iy2,false); //インベントリ全体のbox
var col = $eeeeee;
draw_set_color(col);
draw_rectangle(inv_gui_buffer_x -1,inv_gui_buffer_y -1,ix2,iy2,true); //インベントリ全体のboxの枠線


var dr_x = 0;
var dr_y = 0;

while(dr_y < inv_height)
{
	var col = $303030;
	var ix1 = inv_gui_buffer_x + (dr_x * inv_box_size);
	var iy1 = inv_gui_buffer_y + (dr_y * inv_box_size);
	var ix2 = inv_gui_buffer_x + (dr_x * inv_box_size + inv_box_size);
	var iy2 = inv_gui_buffer_y + (dr_y * inv_box_size + inv_box_size);
		
	//枠線を描画
	draw_set_color(col);
	draw_rectangle(ix1,iy1,ix2,iy2,true);
	

	//debug: myidを表示
	draw_set_color(c_white);;
	draw_text(ix1,iy1,inventory[dr_x,dr_y]);
	draw_text(ix1,iy1 + 20,inventory_lump[dr_x,dr_y]);
	draw_text(ix1,iy1 + 40,inventory_amount[dr_x,dr_y]);
	
	dr_x += 1;
	if(dr_x >= inv_width)
	{
		dr_y += 1;
		dr_x = 0;
	}
}

var dr_x = 0;
var dr_y = 0;

while(dr_y < inv_height)
{
	var ix1 = inv_gui_buffer_x + (dr_x * inv_box_size);
	var iy1 = inv_gui_buffer_y + (dr_y * inv_box_size);
	
	//spriteを描画
	if(inventory_sprite[dr_x,dr_y] != 0)
	{
		draw_sprite(inventory_sprite[dr_x,dr_y],0,ix1,iy1);
	}
	
	dr_x += 1;
	if(dr_x >= inv_width)
	{
		dr_y += 1;
		dr_x = 0;
	}
}

draw_set_alpha(1);
draw_set_color(c_white);