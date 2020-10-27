///@desc 初期値


#region //シールドと損傷

damage	= 0; //攻撃を受けた時、その威力。

body_size = max(sprite_width,sprite_height);
shield_radius	= (body_size / 2) + 6;	//シールドの半径。このシールドのサイズは最も基本的なもの。
shield	= 0; //現在展開中の総シールド枚数

#endregion

#region //装備

casting = false;			//詠唱中
fire_now = false;			//今銃撃をするかどうか
holding_slot	= -1;		//今"構えている"スキルのスロット番号

//装備スロット変数 以下の変数はscr_equip_initで登録される。
//equipment_slot	[0] = 0;		//装備スロット、0〜8orもっとある
//equip_type		[0] = 0;		//装備タイプ
//slot_update		[0]	= true;		//スロットを更新するか。
//slot_need_energy	[0] = 0;		//各スロットの必要最低電力

//以下、0列は最大値、1列は現在値
//cooldown			[0,0]	= 0;	//クールダウンarray。
//active_stack		[0,0]	= 0;	//アクティブ可能回数。1以上ならactive可能。
//firerate			[0,0]	= 0;	//連発できるスキルの、連射速度。

//一番初めに、各スロットにidを登録する。空でも0を登録する。
slot_height = 8; //スロット枠の数。8ならslot 0〜7の8枠を持つ。

//casting関係
cast_start_check = false; //キャスト開始時のチェックフラグ

#endregion

#region //聴覚

hearing = 0; //耳に届いた音量
//hear_clearly = 50; //はっきりと聞こえる音量の閾値 TODO

myemitter = audio_emitter_create();


from_sound_point_x	= 0;
from_sound_point_y	= 0;
from_sound_dynamics	= 0;
from_sound_type		= noone;
from_sound_sender	= noone;

#endregion

#region //視界

neck_direction = 0;

target = obj_player;
view_angle = 24; // 視界の範囲 (角度)
view_angle_cos = 360 / (360+view_angle); //角度の実際の計算用
col = c_gray;
target_distance = 0; //ターゲットの近さ（視力に応じて1~3）

//目線の位置
eye_y = 72;

//視力 csvから読み込んだ値をベースに。
eyesight_medium	= eyesight_near * 1.5;
eyesight_far	= eyesight_near * 2;
view_distance	= eyesight_far; // 視界の距離

#endregion

#region //状態

effect_glue = noone;
effect_blow = noone;

#endregion

#region //移動
//移動先の座標への移動距離
x_speed = 0;
y_speed = 0;
#endregion

#region //装備登録処理

//スロット全部更新許可を出す。
for (var i = 0; i < slot_height; i += 1;)
{
	slot_update[i]		= true; //全装備の更新許可
}

//装備slotに応じて各装備の能力を登録
scr_equip_init();

//最初に一度だけ、rifleを装備していたら、holding_slotを自動的にそれに。
if(holding_slot == -1)
{
	for(var i = 0; i < slot_height; i += 1;)
	{
		if(equip_type[i] == "rifle")
		{
			holding_slot = i;
			break;
		}
	}
}
#endregion
