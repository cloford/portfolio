//@desc 初期値

#region //roomの初期状態

//ライト管理を生成
if(instance_exists(obj_lighting_init) == false)
{
	instance_create_layer(global.outer_world,global.outer_world,layer,obj_lighting_init);
}

#endregion

#region //light

var mylight = instance_create_layer(global.outer_world,global.outer_world,"lay_light",obj_light_actor_round);
mylight.creator = id;
var myspotlight = instance_create_layer(global.outer_world,global.outer_world,"lay_light",obj_light_actor_spot);
myspotlight.creator = id;

#endregion

#region //基本ステータス

//耐久力
hit_point_cap = 10;			//耐久力最大値
hit_point = hit_point_cap;	//耐久力

//移動速度
walk_speed_init = 5;			//スピード初期値
walk_speed = walk_speed_init;	//スピード現在値
fetus_speed_rate = 0.2;			//胎児状態の移動速度係数
move_direction = 0;				//移動方向

//視力
eyesight_near	= 324;

//電力システム
energy_cap			= 800;			//最大充電量
energy				= energy_cap;	//電力
energy_charge_speed	= 1;			//電力充電速度

//所属
team		= "player";

//装備
equipment_slot = obj_player_backpack.equipment_slot; //inventoryから取得する。

#endregion

#region //操作入力

hascontrol	= true;		//操作可能か
key_intract	= false;	//インタラクトキー
intract_to = noone;		//インタラクト対象
key_inventory = false;	//インベントリを開く default: vk_tab
open_inventory = false;	//インベントリを開いているか

#endregion

#region //胎児状態

fetus = false; //胎児モード
recoverd = 0; //胎児状態で取り戻した装備の数
dead = false; //死亡モード。hideoutへ戻る。

#endregion

//parentのコードをロード
event_inherited();