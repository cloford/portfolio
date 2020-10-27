/// @description actorに触れたとき

if(check_fire == false) return; //発射前なら無視

for(var i = 0; i < ignore_count; i += 1)
{
	//ignore_listに登録済みなら無視
	if(ignore_list[i] == touch_actor) return;
}

//対象にダメージを与え、ignore_listに登録。
touch_actor.damage += damage;
ignore_list[ignore_count] = touch_actor;
ignore_count += 1;
touch_actor = noone;