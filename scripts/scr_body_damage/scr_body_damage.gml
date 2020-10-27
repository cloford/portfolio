//攻撃を直接受けた時の、ダメージ処理。

//damage処理
if (damage >= 1)
{
	hit_point -= damage;
	damage = 0;
	if(hit_point <= 0)//hit_pointが0未満になったら、致命傷処理
	{
		event_user(4); //death処理
		hit_point = 0;
	}
}