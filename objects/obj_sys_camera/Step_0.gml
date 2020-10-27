/// @desc カメラ位置はstep更新

if(stop == true) return;
if(instance_exists(obj_sys_inventory)) return;


if(manual_mode == false)
{
	//カメラ位置計算更新（画面中央位置）
	cam_pos_x = (follow.x * view_rate) + (mouse_x * scope_rate);
	cam_pos_y = (follow.y * view_rate) + (mouse_y * scope_rate);
}
else //手動
{
	cam_pos_x = cam_pos_x - ((cam_pos_x - manual_x) / 10);
	cam_pos_y = cam_pos_y - ((cam_pos_y - manual_y) / 10);
}

//実際のカメラ位置を更新
camera_set_view_pos(cam,cam_pos_x - view_w_half,cam_pos_y - view_h_half);