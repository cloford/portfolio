/// @description 購入成立。buyフラグ削除

var inv_x = 0;
var inv_y = 0;

while(inv_y < inv_height)
{
	if(inventory_buy[inv_x, inv_y] = true)
	{
		inventory_buy[inv_x, inv_y] = false;
	}
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}