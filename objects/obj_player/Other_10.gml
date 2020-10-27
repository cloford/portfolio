/// @description 装備スロットを更新
//slot_updateがtrueのslotのみが更新される。

scr_equip_init();

audio_play_sound(se_door_close,50,false);

obj_player_backpack.slot_update = slot_update;