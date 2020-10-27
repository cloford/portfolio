/// @description 売却決定


obj_rm_hideout.money += (total_price * sell_rate);
total_price = 0;

var inv_x = 0;
var inv_y = 0;

while(inv_y < inv_height)
{
	inventory		 [inv_x,inv_y] = 0;	//itemID init
	inventory_amount [inv_x,inv_y] = 1;	//amount init
	inventory_lump	 [inv_x,inv_y] = 0;	//lump init
	inventory_sprite [inv_x,inv_y] = 0;	//sprite_init
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}

audio_play_sound(se_money_2 ,50, false);