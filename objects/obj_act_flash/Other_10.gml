/// @description 実行


//とりあえずマウスの位置にワープするだけ
audio_play_sound(se_door_close,50,false);
creator.x = mouse_x;
creator.y = mouse_y;
instance_destroy();