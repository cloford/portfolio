/// @desc textbox 会話時に生成される一時オブジェクト

text[0,0] = "error: text not found";
choice[0,0] = "error: choice not found";

page = 0;

//speak_end = false;

if (instance_exists(obj_player))
{
	obj_player.hascontrol = false;
}

xBuffer = 32; //テキストボックスと外側との距離、およびボックスと本文ボックスの距離
yBuffer = 32;

box_ut = obj_sys_manager.box_ut; //テキストボックスを上側に配置するか、下側に配置するか

boxwidth	= (window_get_width())-(xBuffer); //TODO: この変数は直感的ではない定義である
boxHeight	= 208;

box_x = xBuffer; 
box_y = yBuffer;

stringHeight = string_height(text[0,0])*1.25; //行間

creator = noone;
charCount = 0;
//name = noone;

choice_mode = false;
choice_cursor = 0;
choice_items = 0;
c_flag = 0;
question_flag = 0;
press_space = false; //スペースキーまたは左クリックを押したか

if (string_char_at(text[c_flag,page],1) == "?") //選択肢チェック
{
	text[c_flag,page] = string_delete(text[c_flag,page],1,1); //1文字目を削除して
	choice_items = array_length_2d(choice,c_flag);
	choice_mode = true; //選択肢モード
}
if (string_copy(text[c_flag,page],1,2) == "mf")//フラグ変動チェック
{
	creator.my_c_flag = string_copy(text[c_flag,page],3,1); //mfフラグナンバーを与える
	text[c_flag,page] = string_delete(text[c_flag,page],1,3); //mf消す
}