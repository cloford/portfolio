


if (distance_to_object(obj_player) <= 2) //2ドット以内なら。要検討
{
	if (keyboard_check_pressed(vk_space)) && (obj_player.hascontrol)
	{
		if (myTextbox == noone)
		{
			myTextbox = instance_create_layer(x,y,"lay_text",obj_sys_textbox);
			myTextbox.text = myText; //テキスト呼び出し者（話者）のテキストをtextboxに渡す
			myTextbox.choice = myChoice;
			myTextbox.creator = self; //話者のIDをtextboxに渡す
			myTextbox.c_flag = my_c_flag;
		}
		instance_create_layer(0,0,"lay_ins_player",obj_weapon_bar)
		visible = false;
	}
}

