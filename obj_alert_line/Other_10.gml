/// @description 初期値計算

cast_count = cast_time;
damage_type = "normal";

//方向とレンジから、終着点を計算。
range_end_x = lengthdir_x(skill_range, direction);
range_end_y = lengthdir_y(skill_range, direction);
range_end_x = x + range_end_x;
range_end_y = y + range_end_y;