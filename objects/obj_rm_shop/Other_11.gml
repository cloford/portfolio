/// @description 購入成立

//obj_rm_hideout.inventory = obj_rm_shopcart.inventory
//obj_rm_hideout.inventory_amount = obj_rm_shopcart.inventory_amount

obj_rm_hideout.money -= total_price;
total_price = 0;

with(obj_rm_shopcart) event_user(2);

audio_play_sound(se_money_2, 50, false);