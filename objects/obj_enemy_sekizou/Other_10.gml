///@desc ショットガン

if(sekizo_direction == "right")
{
	shoot_direction = 270;
}

if(sekizo_direction == "left")
{
	shoot_direction = 90;
}

for(i=0; i<=11; i+=1)
{
	mybullet				= instance_create_layer(x,y,layer,obj_bullet);
	mybullet.creator		= creator;
	mybullet.team			= team;
	mybullet.cast_time		= cast_time;
	mybullet.bullet_speed	= bullet_speed;
	mybullet.damage			= damage;
	mybullet.direction		= shoot_direction;
	mybullet.skill_range	= 1920;
	mybullet.image_angle	= mybullet.direction;
	shoot_direction			= shoot_direction + 15;
	with(mybullet) event_user(0);
}


/*
if(direction == 270)
{
	var fire_x = irandom(room_width);
	var fire_y = 0;
}
else if(direction == 0)
{
	var fire_x = 0;
	var fire_y = irandom(room_height);
}



mybullet				= instance_create_layer(fire_x, fire_y, layer, obj_boss_mt_beam);
mybullet.creator		= id;
mybullet.team			= "boss";
damage_type				= "normal";
mybullet.cast_time		= 60;
mybullet.skill_range	= 1920;
mybullet.damage			= 3;
mybullet.bullet_speed	= 12;
mybullet.direction		= direction;
mybullet.image_angle = mybullet.direction;
with(mybullet) event_user(0);

*/