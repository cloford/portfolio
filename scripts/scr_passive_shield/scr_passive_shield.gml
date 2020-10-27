//自動シールド（パッシブシールド）処理。
//事前にscr_equip_init必須



//シールドにbulletが触れたら、シールドを消費
if(shield >= 1)
{
	var inst = collision_circle(x,y - (sprite_height / 2),shield_radius,obj_parent_bullet,false,true);
	if(inst != noone) and (inst.creator != id) and (inst.team != team)
	{
		inst.touch_actor = id;
		with(inst) event_user(1);//衝突イベントスタート
	}
	
	if(damage > 0)
	{
		//active_stackが残っているshieldのスロットを検索。そこからstackを一個消耗し、damageを無効化
		for (var i = 0; i < slot_height; i += 1)
		{
			if (equip_type[i] == "shield") and (active_stack[i,1] >= 1)
			{
				active_stack[i,1] -= 1;
				shield -= 1;
				energy -= slot_need_energy[i];
				damage = 0;
				break;
			}
		}
	}
}
//シールドが無いのに弾が触れたなら
else scr_actor_noshield();