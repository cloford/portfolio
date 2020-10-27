/// @description Insert description here
// You can write your code in this editor

if(saving == true)
{
	draw_text(0,0,"!!!SAVING!!!");
	draw_text(0,30,count);
}

for(var i = 0; i < nowsf; i += 1)
{
	draw_text(0, 80 + (i * 20), save_frame[i]);
}