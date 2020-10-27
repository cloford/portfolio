if (myTextbox == noone)
{
	myTextbox = instance_create_layer(x,y,"lay_text",obj_sys_textbox);
	myTextbox.text = myText; //テキスト呼び出し者（話者）のテキストをtextboxに渡す
	myTextbox.choice = myChoice;
	myTextbox.creator = self; //話者のIDをtextboxに渡す
	myTextbox.c_flag = my_c_flag;
}