///@desc item_size_w, item_size_h
//指定された空きマスgo_x, go_yにサイズが入るか

//前提変数
//go_x
//go_y
//item_size_w
//item_size_h
//moveto
//moveto.inv_width
//moveto.inv_height
//moveto.inventory_lump

//return
//boolean (can_moveに格納する前提)

var item_size_w = argument0;
var item_size_h = argument1;

if (item_size_w + item_size_h > 2) //大型アイテムでないならTrueで処理を抜ける。そうでなら走査開始。
{
	var check_x = go_x;
	var check_y = go_y;
		
	if(moveto.inv_width < (go_x + item_size_w)) //インベントリからはみでるならfalse_横
	{
		return false;	
	}
	if(moveto.inv_height < (go_y + item_size_h)) //インベントリからはみでるならfalse_縦
	{
		return false;	
	}
	
	//アイテムサイズの範囲のセルが全てID0かチェック
	while(check_y < go_y + item_size_h)
	{
		if (moveto.inventory_lump[check_x,check_y] == 0)
		{
			check_x += 1;
			if(check_x >= go_x + item_size_w)
			{
				check_y += 1;
				check_x = go_x;
			}
		}
		else
		{
			return false; //0以外のIDが出たらfalse
				
		}
	}
	return true; //範囲チェック完了できたらTrue
}
else
{
	return true; //そもそも大型アイテムじゃないならTrue
}