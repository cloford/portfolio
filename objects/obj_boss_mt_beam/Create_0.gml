//@desc 初期化

myemitter = audio_emitter_create();

depth = -300;

touch_actor = noone;

check_fire = false;

ignore_list[0] = noone;
ignore_count = 0;

//注意
//bulletのspriteのコリジョンマスクは精密にすること。単なるrectangleではだめ。


team			= "boss";
damage_type		= "normal";
cast_time		= 70;
skill_range		= 1920;
damage			= 3;
bullet_speed	= 12;