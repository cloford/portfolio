///@desc 攻撃中、ターゲットとの距離を調整する

//視線をtargetへ向ける
var to_dir = point_direction(x, (y - eye_y), target.x, target.y - (target.sprite_height /2) );
var diff = angle_difference(to_dir,neck_direction);
neck_direction += (min(abs(diff / 10), 10) * sign(diff));

if		(distance_to_object(target) < eyesight_near) //近すぎるので離れる
{
	target_distance = 3;
	var move_direction = abs(neck_direction - 180);
	x_speed = lengthdir_x (walk_speed, move_direction);
	y_speed = lengthdir_y (walk_speed, move_direction);
}
else if	(distance_to_object(target) < eyesight_medium)	target_distance = 2; //適正距離
else if	(distance_to_object(target) < eyesight_far)	//遠すぎるので近づく
{
	target_distance = 1;
	var move_direction = neck_direction;
	x_speed = lengthdir_x (walk_speed, move_direction);
	y_speed = lengthdir_y (walk_speed, move_direction);
}

//射撃許可
fire_now = true;