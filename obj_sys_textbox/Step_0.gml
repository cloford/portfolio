
//TODO: ギリギリでスペース入れると読み飛ばしそう

#region //特殊テキスト（選択肢・フラグ変更）
if (string_char_at(text[c_flag,page],1) == "_") //話者破壊条件、一文字目に"_"
{
	text[c_flag,page] = string_delete(text[c_flag,page],1,1); //1文字を削除して
	creator.visible = false;
	creator.destroy_self = true;
}
if (string_copy(text[c_flag,page],1,2) == "mf") //フラグ開始条件 、一文字目に"mf"
{
	creator.my_c_flag = real(string_copy(text[c_flag,page],3,1)); //mfフラグナンバーを与える
	text[c_flag,page] = string_delete(text[c_flag,page],1,3); //mf消す
}
if (string_copy(text[c_flag,page],1,2) == "sf") //イベントフラグセット条件 、一文字目に"sf"
{
	var sfcount = string_pos(">",text[c_flag,page]); //">"の位置
	ds_map_add(obj_sys_flag.event_flag,string_copy(text[c_flag,page],5,(sfcount - 5)),real(string_char_at(text[c_flag,page],3)));
	text[c_flag,page] = string_delete(text[c_flag,page],1,sfcount); //">"まで消す
}
if (string_char_at(text[c_flag,page],1) == "?") //選択肢開始条件 、一文字目に"?"
{
	question_flag = real(string_copy(text[c_flag,page],2,1)); //?フラグナンバーを与える
	text[c_flag,page] = string_delete(text[c_flag,page],1,2); //2文字を削除して
	choice_items = array_length_2d(choice,question_flag);
	choice_mode = true; //選択肢モード
}
if (string_char_at(text[c_flag,page],1) == "!") //無言終了開始条件 、一文字目に"!"
{
	instance_destroy(); //テキストボックス消滅
	creator.alarm[1] = 1; //1f後に会話可能フラグをリセット
}

#endregion

#region //テキスト送り、ページ送り

if(mouse_check_button_pressed(mb_left)) or (keyboard_check_pressed(vk_space))
{
	press_space = true;
}

if (press_space = true)
{
	if (charCount < string_length(text[c_flag,page])) //本文を表示している途中か？（発声中か？）
	{
		charCount = string_length(text[c_flag,page]); //本文を全て表示
	}
	else //本文は全て表示されている
	{
		if (page+1 < array_length_2d(text,c_flag)) && (!choice_mode) //まだ本文が最終ページではないなら
		{
		page += 1; //現在のページ数に1ページを追加して次のページにする
		charCount = 0; //発声中文字カウントをリセット
		}
		else if (choice_mode) //選択肢モード中
		{
			c_flag = choice_cursor + 1;
			creator.my_c_flag = choice_cursor + 1;
			choice_mode = false;
			charCount = 0;
			page = 0;
		}
		else//最終ページだったなら
		{
		instance_destroy(); //テキストボックス消滅
		creator.alarm[1] = 1; //1f後に会話可能フラグをリセット
		}
	}
	press_space = false;
}
//1フレーム後にmyTextboxをnooneにしないと、このcharのstepイベントにあるif(myTextbox == noone)を満たしてループに入ってしまう。

#endregion



#region //選択モード

var wcx = window_get_width() / choice_items;

if (device_mouse_x(0) > wcx * 3)
{
	choice_cursor = 3;
}
else if (device_mouse_x(0) > wcx * 2)
{
	choice_cursor = 2;
}
else if (device_mouse_x(0) > wcx * 1)
{
	choice_cursor = 1;
}
else if (device_mouse_x(0) > 0)
{
	choice_cursor = 0;
}

if (keyboard_check_pressed(ord("A"))) choice_cursor -= 1;
if (keyboard_check_pressed(ord("D"))) choice_cursor += 1;
choice_cursor = clamp(choice_cursor,0,choice_items-1)
//カーソルスクロール
//if (choice_cursor >= choice_items) choice_cursor = 0;
//if (choice_cursor < 0) choice_cursor = choice_items-1;

#endregion

/*
string_char_at(str,index)
*/



