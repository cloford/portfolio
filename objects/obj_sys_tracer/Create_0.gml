grid = mp_grid_create(0,0,room_width/16,room_height/16,16,16);//gridを作成する
mp_grid_add_instances(grid,obj_wall,false);//grid上にobj_wallを配置する
mp_grid_add_instances(grid,obj_floor_door,false);
path = path_add();//パスのインデックスを作成

/*
TODO:
おそらく同時にパスを作成しない限りはここを参照して使える模様（未検証）
複数のインスタンスから参照して動作したので検討の余地あり
もしくはglobal.pathなどに設定して使用するとか
しかし同時に参照してエラーを吐いた場合の処理、書き直しが手間のためそのまま保持しておく
*/
