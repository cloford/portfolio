/// @desc 変数の説明、初期化

creator = noone;
has_equip = false; //equipを持ってるか
position_left = true;

init_end	= false;
can_drop	= false; //インベントリにドロップできるか
can_stack	= false; //スタックできるか。
can_move	= false; //alt+clickで移動チェックに成功したか
mode_drag	= false;
mode_click	= false;
in_inv_box	= false;

moveto = obj_rm_shopcart;
try_buy_amount = 0; //購入しようとする数

total_price = 0;

#region //draw関係

money_draw_x = window_get_width() / 2;
money_draw_y = 128;

#endregion

#region //inventory
inv_width	= 8; //インベントリサイズ　横
inv_height	= 8; //インベントリサイズ　縦

//インベントリ 0init(ID)
var inv_x = 0;
var inv_y = 0;

while(inv_y < inv_height)
{
	inventory[inv_x,inv_y] = 0;			//itemID init
	inventory_amount[inv_x,inv_y] = 1;	//amount init
	inv_x += 1;
	if(inv_x >= inv_width)
	{
		inv_y += 1;
		inv_x = 0;
	}
}
#endregion

#region //inventory ID 登録（debug）

inventory[0,0] = 10;
inventory[1,0] = 11;
inventory[2,0] = 14;
inventory[3,0] = 1;
inventory[2,1] = 1;
inventory[3,1] = 1;
inventory[0,1] = 10;

#endregion

#region //購入ボタン関係

//購入ボタンの位置とサイズなど
tradeb_w = sprite_get_width(spr_rm_shop_buy);
tradeb_h = sprite_get_height(spr_rm_shop_buy);
tradeb_x = (window_get_width()	* 0.5)	- (tradeb_w / 2); //ボタン原点左上
tradeb_y = (window_get_height()	* 0.75)	- (tradeb_h / 2); //ボタン原点左上
tradeb_alpha = 0.5;

//プレスボタンease関係
start = 0;
dest = tradeb_w;
duration = obj_sys_manager.careful_duration;
press_time = 0;
press_counter = 0;

#endregion

