///@desc ビーム発射

if(direction == 270)
{
	var fire_x = irandom_range(100,1820);
	var fire_y = 0;
}
else if(direction == 0)
{
	var fire_x = 0;
	var fire_y = irandom_range(100,980);
}


mybullet				= instance_create_layer(fire_x, fire_y, layer, obj_boss_mt_beam);
mybullet.creator		= id;
mybullet.direction		= direction;
mybullet.image_angle = mybullet.direction;
with(mybullet) event_user(0);


//obj_ms_frametyper.save_frame[obj_ms_frametyper.nowsf] = obj_ms_frametyper.count;
//obj_ms_frametyper.nowsf += 1;