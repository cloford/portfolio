
#region //キー入力の変数を定義。各変数はキー入力されると1に。

if (hascontrol) //操作許可
{
	key_left	= keyboard_check(vk_left);
	key_right	= keyboard_check(vk_right);
	key_up		= keyboard_check(vk_up);
	key_down	= keyboard_check(vk_down);
//	key_sneak	= keyboard_check(vk_control);
	key_run		= keyboard_check(vk_shift);
	key_Z		= keyboard_check(ord("Z"));
	key_X		= keyboard_check(ord("X"));
	key_C		= keyboard_check(ord("C"));
}
else
{
	key_left = 0;
	key_right = 0;
	key_up = 0;
	key_down = 0;
//	key_walk = 0;
	key_run = 0;
	key_Z = 0;
	key_X = 0;
	key_C = 0;
}

#endregion

#region //移動速度の計算

var hmove = key_right - key_left;
var vmove = key_down - key_up;



if (hmove != 0 or vmove != 0) //移動キーが入力されているなら
{
	stepping += 1;
	direction = round(point_direction(0,0,hmove,vmove));
	switch (direction)
	{
		case 0: sprite_index = spr_player_rw_strip4; break;
		case 90: sprite_index = spr_player_uw_strip4; break;
		case 180: sprite_index = spr_player_lw_strip4; break;
		case 270: sprite_index = spr_player_dw_strip4; break;
	}
	motion_set(direction,spd);
	if (((stepping + 4) mod 30) == 0)
	{
		audio_sound_pitch(se_footstep,random_range(0.8,1.2));
		audio_play_sound(se_footstep,50,false);
	}
}
else
{
	stepping = 0;
	switch (direction)
	{
		case 0: sprite_index = spr_player_r; break;
		case 90: sprite_index = spr_player_u; break;
		case 180: sprite_index = spr_player_l; break;
		case 270: sprite_index = spr_player_d; break;
	}
	motion_set(direction,0);
}

#endregion



#region //xy慣性+Collision判定

// 水平ぶつかり+スキマツメ判定。壁にぴったりくっつける

if(speed != 0)
{
	if (!place_free(x+lengthdir_x(spd,direction),y)) //水平移動先（x+hsp）がobj_wallと重なるか？
	{
		while (place_free(x+sign(lengthdir_x(spd,direction)),y)) //1ピクセルだけその方向に移動したとして、重ならないならば
		{
			x = x + sign(lengthdir_x(spd,direction)); //現在地xを移動速度方向へ1ピクセルずらす。つまり1ピクセルだけ壁に移動。
		}
		hspeed = 0;
	}
	if (!place_free(x,y+lengthdir_y(spd,direction))) 
	{
		while (place_free(x,y+sign(lengthdir_y(spd,direction)))) //上下隙間ツメ
		{
			y = y + sign(lengthdir_y(spd,direction)); 
		}
		vspeed = 0;
	}
}


#endregion

