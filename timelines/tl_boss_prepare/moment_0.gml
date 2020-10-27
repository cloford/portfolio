///@desc ボス戦スタート準備

//カメラ位置をボスモードに
obj_sys_camera.manual_mode = true;
obj_sys_camera.manual_x = 960;
obj_sys_camera.manual_y = 540;

//playerを部屋の中へ
obj_player.hspeed = -5;
obj_player.hascontrol = false;

//部屋のライトを点灯
obj_light_bigroom.lightstart = true;
