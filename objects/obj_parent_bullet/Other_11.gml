/// @description actorに触れたとき

if(check_fire == false) return; //発射前なら無視

touch_actor.damage += damage;
touch_actor = noone;
instance_destroy();