/// @description 

/*

監視カメラのようにぐるぐる回る。半分くらいは目をつぶっている。発見すると加速しながら追いかけてくるが、避けて壁にぶつけると倒せるz

*/

image_speed = 0;
image_index = 3;

found_player = false;
founding = false;

steps = 0;

eye_open = false;

footspeed = 1;						//移動速度（初速）
view_distance_init = 512;			//視認距離
view_distance = 0;					//視認距離現在値
view_angle_init = 16;				//視野角
view_angle = 0;						//視野角現在値
rotate_speed = choose(-1.2,1.2);	//回転速度および方向
braking_force = 0.03;				//制動力
acceleration = 0.07;				//加速度
eye_time = 150;						//開眼可能時間

alarm[0] = room_speed *1;