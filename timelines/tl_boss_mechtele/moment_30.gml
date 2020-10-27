///@desc ボス戦スタート

//プレイヤーの操作許可開始
obj_player.speed = 0;
obj_player.hascontrol = true;

//自動ドアで入り口と出口を閉じる
instance_create_layer(844, 0, layer, obj_autodoor);
instance_create_layer(844, 1020, layer, obj_autodoor);

//コア露出
with(obj_boss_mechtele) event_user(0);

//music start
audio_play_sound(bgm_boss_mechtele,0,false);

//debug
obj_ms_frametyper.saving = true;

