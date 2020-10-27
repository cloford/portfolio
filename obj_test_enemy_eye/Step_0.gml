/// @description Insert description here
// You can write your code in this editor


if (instance_exists(obj_player) == false)
{
	return;
}


if (eye_open == false)
{
	view_angle = max(0,view_angle - 4);
	view_distance = max(1,view_distance / 2);
}
else
{
	view_angle = min(view_angle + 4,view_angle_init);
	view_distance = min(view_distance * 2, view_distance_init);
}


speed = speed * (1 - braking_force);

if (founding == false)
{
	return;
}

steps += 1;
if (steps >= eye_time)
{
	alarm[2] = true;
}

if (found_player == false)
{
direction += rotate_speed;
}

found_player = false;

//視界距離内にobj_playerがいないなら、即座に処理を終了する（retrun;）
var dist = point_distance (x, y, obj_player.x, obj_player.y);
if (dist > view_distance)
{
	return;
}

var x1 = lengthdir_x (x, direction);
var y1 = lengthdir_y (y, direction);

var x2 = obj_player.x - x;
var y2 = obj_player.y - y;

var dot = dot_product_normalized (x1, y1, x2, y2);
var deg = darccos(dot);

if (view_angle > deg)
{
	var inst = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, true);
	if (inst == noone) //playerまでの直線にwallがぶつからないなら
	{
		found_player = true;
		var to_dir = point_direction(x, y, obj_player.x, obj_player.y);
		var diff = angle_difference(to_dir, direction);
		direction += (min(abs(diff / 10), 1) * sign(diff));
		speed = footspeed;
		footspeed += acceleration;
		steps = steps * 0.9;
	}
}

image_angle = direction;


//TODO : footspeedを視界から外れた時徐々にリセット？