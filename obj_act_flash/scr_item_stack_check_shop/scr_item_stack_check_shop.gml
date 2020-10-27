//相手のinvenotryの左上から1マスずつチェックして同一IDかつamountがmaxでないslotを走査
//最終的に、相手のインベントリ内の全ての同一IDをmaxにするか、またはその前にこっちのclick_amountが尽きる。
//その後、こっちのinventory_amountも更新する。

//argument0 == 対象item idのmax_amount

//前提変数
//click_id
//click_amoiunt
//inventory_amount[click_inv_x, click_inv_y]
//moveto
//moveto.inventory[i, i]
//moveto.invenotry_amount[i, i]
//moveto.inventory_buy[i, i]
//moveto.width
//moveto.height

var to_amount_max = argument0;

var ss_x = 0;
var ss_y = 0;

while(ss_y < moveto.inv_height)
{
	//同一IDかつbuyフラグあり、かつamountがまだmaxではないなら
	if(moveto.inventory[ss_x, ss_y] == click_id) and (moveto.inventory_amount[ss_x, ss_y] < to_amount_max) and (moveto.inventory_buy[ss_x, ss_y] == true)
	{
		var sum_amount = (click_amount + moveto.inventory_amount[ss_x, ss_y]); //合算
		if(sum_amount <= to_amount_max) //合算値が最大を超えないなら
		{
			moveto.inventory_amount[ss_x, ss_y] = sum_amount;
			click_amount = 0;
			break;
		}
		else //合算値が最大を超えるなら
		{
			moveto.inventory_amount[ss_x,ss_y] = to_amount_max; //相手amountをmaxに
			click_amount = sum_amount - to_amount_max;			//こっちはその差に
			//走査続行
			ss_x += 1;
			if(ss_x >= moveto.inv_width)
			{
				ss_x = 0;
				ss_y += 1;
			}
		}
	}
	else 
	{
		//走査続行
		ss_x += 1;
		if(ss_x >= moveto.inv_width)
		{
			ss_x = 0;
			ss_y += 1;
		}
	}
}