/// @description 致命傷

if(fetus == false) //まだ胎児でないなら胎児に。
{
	fetus = true;
	sprite_index = spr_player_fetus;
	walk_speed = walk_speed_init * fetus_speed_rate;

	for(var i = 0; i < slot_height; i += 1)
	{
		//fragment側処理
		myfragment = instance_create_layer(x,y,layer,obj_player_fragment);
		myfragment.slot = i;
		myfragment.slot_item_id = equipment_slot[i];
		with(myfragment) event_user(0);
	
		//equipment処理
		equipment_slot[i]	= 0; //ID消去
		obj_player_backpack.equipment_slot[i] = 0;
		slot_update[i]		= true; //更新許可
	}

	event_user(0); //equip slot更新
}
else	//すでに胎児なら死亡。
{
	dead = true;
	
	//equipmentを空に
	for(var i = 0; i < slot_height; i += 1)
	{
		obj_player_backpack.equipment_slot[i] = 0;
	}
	
	//inventoryを空に
	var inv_x = 0;
	var inv_y = 0;
	while(inv_y < obj_player_backpack.inv_height)
	{
		obj_player_backpack.inventory[inv_x,inv_y] = 0;			//itemID init
		obj_player_backpack.inventory_amount[inv_x,inv_y] = 1;	//amount init
		inv_x += 1;
		if(inv_x >= obj_player_backpack.inv_width)
		{
			inv_y += 1;
			inv_x = 0;
		}
	}
	
	//カメラを停止
	obj_sys_camera.stop = true;
	
	//本体をroomから遠ざける。
	x = global.outer_world;
	y = global.outer_world;
}