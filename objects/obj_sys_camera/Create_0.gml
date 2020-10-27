cam = view_camera[0]; //cameraID 0をcamへ取得
follow = obj_player; //obj_playerに追従
view_w_half = camera_get_view_width(cam) * 0.5; //視界の横長さ半分値
view_h_half = camera_get_view_height(cam) * 0.5; //視界の縦長さ半分値

view_rate = 0.75; //カメラ位置のプレイヤー側からの比率
scope_rate = 0.25; //同マウス側からの比率

manual_mode = false; //カットシーンなどでカメラの位置を強制するモード
stop = false;		//カメラを強制的に停止するモード