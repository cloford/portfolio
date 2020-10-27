/// @desc セーブのテスト、ALT+S or ALT+L

//未完成。TODO

//ALT+Sでセーブ、ALT+Lでロード
//詳細はiniをみよ。
if(keyboard_check_pressed(ord("S"))) and (keyboard_check(vk_alt))
{
	audio_play_sound(se_door_open,50,false); //セーブ時に音を鳴らすぞ
	
	ini_open("savedata.ini"); //openでファイルを指定
	ini_write_real("TESTVAL1","SCORE",savetest1); //realは数字をiniに記録
	ini_write_string("TESTVAL2","TESTSTRING",savetest2); //stringはテキストを格納
	ini_close(); //閉じないとメモリリーク
	
}

if(keyboard_check_pressed(ord("L"))) and (keyboard_check(vk_alt))
{
	audio_play_sound(se_door_close,50,false); //ロード時に音を鳴らすぞ
	ini_open("savedata.ini");
	savetest1 = ini_read_real("TESTVAL1","SCORE",0); //適当な変数にiniの指定した値を格納。realは数字
	savetest2 = ini_read_string("TESTVAL2","TESTSTRING","***NO DATA***"); //stringはテキスト

	ini_close(); //閉じないとメモリリーク

}