///@desc item_size_w, item_size_h

//前提変数
//moveto
//moveto.inv_width
//moveto.inv_height
//moveto.inventory_lump

//return
//can_move
//go_x
//go_y

go_x = 0;
go_y = 0;
can_move = false;

while(go_y < moveto.inv_height)
{
	if(moveto.inventory_lump[go_x,go_y] == 0)
	{
		//大型アイテムでも入るかチェック
		can_move = scr_item_oogatacheck(argument0, argument1);
		if(can_move == true) return;
		else
		{
			go_x += 1;
			if(go_x >= moveto.inv_width)
			{
				go_x = 0;
				go_y += 1;
			}
		}
	}
	else
	{
		go_x += 1;
		if(go_x >= moveto.inv_width)
		{
			go_x = 0;
			go_y += 1;
		}
	}
}