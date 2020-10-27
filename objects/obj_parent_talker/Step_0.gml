if (obj_player.key_intract) && (obj_player.hascontrol)
{
	if (distance_to_object(obj_player) <= 2) //2ドット以内なら。要検討
	{
		if (myTextbox == noone)
		{
			myTextbox = instance_create_layer(x,y,"lay_text",obj_sys_textbox);
			myTextbox.text = myText; //テキスト呼び出し者（話者）のテキストをtextboxに渡す
			myTextbox.choice = myChoice;
			myTextbox.creator = self; //話者のIDをtextboxに渡す
			myTextbox.c_flag = my_c_flag;
		}
	}
}
//else
//{
//	if (myTextbox != noone) //話者から離れたにも関わらず会話中であれば
//	{
//	instance_destroy(myTextbox); //テキストボックスを消す
//	myTextbox = noone; //変数をnooneにリセットし、再度会話可能にする
//	}
//}

//TODO/DONE そもそも会話中の移動許可は不要では
//TODO: ifif入れ子