///@desc 攻撃中、ただその場に立ち続ける

//pathを中断
path_clear_points(path_index);
path_end();
//視線をtargetへ向ける
var to_dir = point_direction(x, (y - eye_y), target.x, target.y - (target.sprite_height /2) );
var diff = angle_difference(to_dir, neck_direction);
neck_direction += (min(abs(diff / 10), 10) * sign(diff));
if		(distance_to_object(target) < eyesight_near)	target_distance = 3;
else if	(distance_to_object(target) < eyesight_medium)	target_distance = 2;
else if	(distance_to_object(target) < eyesight_far)		target_distance = 1;

//射撃許可
fire_now = true;