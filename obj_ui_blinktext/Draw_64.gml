/// @description Insert description here
// You can write your code in this editor

var it = room_get_name(room);
if(count < blink)
{
	var ta = (irandom_range(3,5) / (10));
}
else
{
	var ta = 0.5;
}
draw_set_color(c_white);
draw_set_alpha(ta);
draw_text(0,0,it);
draw_sprite(spr_barcode_64, 0, 0,30);

/* ランダム生成バーコード
for(var i = 1; i < barcode_length; i += 1)
{
	if(irandom(1) == 1) draw_line(i, 30, i, 40);
}
*/
/* 変数テスト記述
draw_text(0,40,count);
draw_text(0,60,blink);
*/

draw_set_alpha(1);