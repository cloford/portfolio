//equipment_slotのinit。CSVから必要な情報を読み込み2d配列に保存。
//slot_heightとequip_slotが必須
//このスクリプトは、装備をする実体（playerやenemy）自身が使う。

for(var i = 0; i < slot_height; i += 1)
{
	if(slot_update[i] == false) continue; //update許可が出ているスロットのみ。
	slot_update[i] = false; //更新完了フラグ
	//0列目にIDさえ入っていれば、自動的に装備typeなどの情報を登録する。
	var equipid = equipment_slot[i];
	equip_type[i] = obj_sys_manager.file_csv_item[# 7, equipid];	//装備type

	#region //無の登録、つまり初期化
	slot_need_energy[i] = 0;
	active_type[i]		= 0;
	active_stack[i,0]	= 0;
	active_stack[i,1]	= 0;
	cooldown[i,0]		= 0;
	cooldown[i,1]		= 0;
	firerate[i,0]		= 0;
	firerate[i,1]		= 0;
	#endregion
	
	#region //Shieldの登録
	if(equip_type[i] == "shield")
	{
		equipid -= global.shield_id_offset;
		slot_need_energy[i]		= real(obj_sys_manager.file_csv_item_shields[# 2,equipid]);
		active_type[i]			= string(obj_sys_manager.file_csv_item_shields[# 3,equipid]);
		active_stack[i,0]		= obj_sys_manager.file_csv_item_shields[# 4,equipid];
		active_stack[i,1]		= 0;
		cooldown[i,0]			= obj_sys_manager.file_csv_item_shields[# 5,equipid];
		cooldown[i,1]			= cooldown[i,0];
		firerate[i,0]			= obj_sys_manager.file_csv_item_shields[# 6,equipid];
		firerate[i,1]			= firerate[i,0];
		shield_duration[i,0]	= obj_sys_manager.file_csv_item_shields[# 7,equipid];
		shield_duration[i,1]	= shield_duration[i,0];
	}
	#endregion
	
	#region //rifle
	if(equip_type[i] == "rifle")
	{
		equipid -= global.rifle_id_offset;
		slot_need_energy[i]		= real(obj_sys_manager.file_csv_item_rifles[# 2,equipid]);
		active_type[i]			= string(obj_sys_manager.file_csv_item_rifles[# 3,equipid]);
		active_stack[i,0]		= obj_sys_manager.file_csv_item_rifles[# 4,equipid];
		active_stack[i,1]		= 0;
		cooldown[i,0]			= obj_sys_manager.file_csv_item_rifles[# 5,equipid];
		cooldown[i,1]			= cooldown[i,0];
		firerate[i,0]			= obj_sys_manager.file_csv_item_rifles[# 6,equipid];
		firerate[i,1]			= firerate[i,0];
		bullet_damage[i]		= obj_sys_manager.file_csv_item_rifles[# 7,equipid];
		bullet_speed[i]			= obj_sys_manager.file_csv_item_rifles[# 8,equipid];
		cast_time[i]			= obj_sys_manager.file_csv_item_rifles[# 9,equipid];
		skill_range[i]			= obj_sys_manager.file_csv_item_rifles[# 10,equipid];
		attack_type[i]			= asset_get_index(string(obj_sys_manager.file_csv_item_rifles[# 11,equipid]));
	}
	#endregion

	#region //active skill
	if(equip_type[i] == "active")
	{
		equipid -= global.active_id_offset;
		slot_need_energy[i]		= real(obj_sys_manager.file_csv_item_active[# 2,equipid]);
		active_type[i]			= string(obj_sys_manager.file_csv_item_active[# 3,equipid]);
		active_stack[i,0]		= obj_sys_manager.file_csv_item_active[# 4,equipid];
		active_stack[i,1]		= 0;
		cooldown[i,0]			= obj_sys_manager.file_csv_item_active[# 5,equipid];
		cooldown[i,1]			= cooldown[i,0];
		firerate[i,0]			= obj_sys_manager.file_csv_item_active[# 6,equipid];
		firerate[i,1]			= firerate[i,0];
		cast_time[i]			= obj_sys_manager.file_csv_item_active[# 7,equipid];
		skill_object[i]			= asset_get_index(string(obj_sys_manager.file_csv_item_active[# 8,equipid]));
	}
	#endregion
}

//シールドの残数をカウントしておく
shield = 0;
for (var i = 0; i < slot_height; i += 1)
{
	if (equip_type[i] == "shield")
	{
		shield += active_stack[i,1];
	}
}