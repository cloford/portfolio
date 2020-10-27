///@desc ボス戦スタート

obj_player.speed = 0;
obj_player.hascontrol = true;

//自動ドアで入り口と出口を閉じる
instance_create_layer(844, 0, layer, obj_autodoor);
instance_create_layer(844, 1020, layer, obj_autodoor);

//ボス曲タイムラインを開始
with(obj_rm_boss)
{
	timeline_running = false;
	event_user(1);
}