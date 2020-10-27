/// @description Insert description here
// You can write your code in this editor

to_player = point_direction(x,y,obj_player.x,obj_player.y);

if (!egg)
{
	if (distance_to_object(obj_player)<128)
	{
		motion_set(to_player,3);
		image_angle = to_player;
		image_index = 1;
	}
	
	else
	{
		speed = 0;
		image_index = 0;
	}
	if (place_meeting(x,y,obj_player))
	{
		egg = true;
	}
}
else
{
	image_index = 2;
	image_angle = 0;
	speed = 0;
}