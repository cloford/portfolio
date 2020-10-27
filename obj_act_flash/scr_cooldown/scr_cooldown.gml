//事前にequip_init必須
//slotの下から順にCD処理をする（slot[7]から初めて[0]で終わる


var need_energy = 0; //充電に必要な最低電力を満たしているかの確認変数

for (var i = slot_height -1; i >= 0; i -= 1)
{
	need_energy += slot_need_energy[i]; //必要最低電力
	if(energy <= need_energy) break;	//電力が必要最低電力を下回るなら、cd処理を中断。
	if(equipment_slot[i] == 0)					continue; //装備枠に無が入ってるときは無視
	if(active_stack[i,1] == active_stack[i,0])	continue; //スタックがすでにmaxなら無視
	if(active_type[i] == "toggle_d")			continue; //トグルスキルがアクティブでないなら無視
	
	cooldown[i,1] = max(cooldown[i,1] -1, 0);
	firerate[i,1] = max(firerate[i,1] -1, 0);
	
	//CDが0のとき、stackが上限に達していないなら、stackを1増やす。
	if(cooldown[i,1] == 0) 
	{
		active_stack[i,1] += 1;
		cooldown[i,1] = cooldown[i,0]; //CDを最大値に戻す
		if(equip_type[i] == "shield")	shield += 1; //それが自動シールドなら、シールド1枚展開。
	}
}