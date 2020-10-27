//@desc 初期化

cast_count = 60;
cast_time = 60;
damage = 7;
team = "boss";
image_speed = 0;

myemitter = audio_emitter_create();

depth = -300;

touch_actor = noone;

check_fire = false;

ignore_list[0] = noone;
ignore_count = 0;

//注意
//bulletのspriteのコリジョンマスクは精密にすること。単なるrectangleではだめ。