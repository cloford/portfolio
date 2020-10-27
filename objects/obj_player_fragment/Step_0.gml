/// @description Insert description here
// You can write your code in this editor


#region //移動・浮遊

time += 1;

//初めに飛び出す
if(float_mode == true)
{
	y += sin(time*0.1);
}
else
{
	speed -= 0.2;
}

if(place_free(x,y) == false)
{
	speed = 0;
}

// float mode
if(speed <= 0) and (float_mode == false)
{
	speed = 0;
	float_mode = true;
}

#endregion

#region //playerによる回収

if(place_meeting(x,y,obj_player)) and (float_mode == true)
{
	obj_player.equipment_slot[slot] = slot_item_id; 
	obj_player_backpack.equipment_slot[slot] = slot_item_id; 
	obj_player.slot_update[slot] = true;
	obj_player.recoverd += 1;
	obj_player.walk_speed += 1;
	with(obj_player)
	{
		event_user(0); //装備スロット更新
		if(recoverd >= slot_height)
		{
			fetus = false;
			sprite_index = spr_player;
			walk_speed = walk_speed_init;
		}
	}
	instance_destroy();
}

#endregion