///@desc bulletが触れたとき
//bulletが触れたらbulletの衝突イベントを始める
//このスクリプトは、シールドが無いときか、または単にシールドを持っていないenemyで使う。

var inst = instance_place(x,y,obj_parent_bullet);
if(inst != noone) and (inst.creator != id) and (inst.team != team)
{
	inst.touch_actor = id;
	with(inst) event_user(1);//衝突イベントスタート
}