if(instance_exists(obj_player) == false) //playerがいないときreturn TODO:hascontrolをmanagerに管理させる
{
	return;
}


#region Escキーを押したときの処理
if(keyboard_check_pressed(vk_escape))
	{
		draw_check = true;
		obj_player.hascontrol = false;
		menu_control = 1;
		check_escape = !check_escape;
		if(check_escape == false)
			{
				draw_check = false;
				obj_player.hascontrol = true;//プレイヤーのコントロールを復活させる
				menu_control = 0;//menu操作をfalseにして操作不能にする
				menu_committed = -1;//選択肢から選んだ値を元に戻す
				menu_cursor = menu_items - 1;//カーソルをデフォルトの位置へ戻す
			}
		//menu_xとmenu_yがメニューを表示する位置
	}
#endregion

#region ポーズ画面でのクリック処理



#endregion

#region ポーズ画面でのキーボード処理

if(menu_control) //menu_controlが1ならば実行 set 0 in create.
{
	if(keyboard_check_pressed(vk_up)) 
	{
		menu_cursor += 1;//menu_cursor　set 2 in create.
//上を押すとカーソルがプラスされていく
			if(menu_cursor >= menu_items) //カーソルが項目のサイズ(3)を超えた場合カーソルを0（一番下）にカーソルの値を入れる
			{
				menu_cursor = 0;
			}
	}
	if(keyboard_check_pressed(vk_down))

	{
		menu_cursor -= 1;//menu_cursor set 2 in create.
			//↓を押すとカーソルがマイナスされていく
		if(menu_cursor < 0) //カーソルの値がマイナスになった場合項目サイズ(3)から1を減らした一番上にカーソルの値を入れる
		{
			menu_cursor = menu_items - 1;
		}
	}

	if(keyboard_check_pressed(vk_enter))
	{
		menu_committed = menu_cursor;//menu_comittedにカーソルの現在値が入る
	}

	if(mouse_check_button_pressed(mb_left))
	{
			menu_committed = menu_cursor;
	}	
}
	

if((menu_committed != -1) && (menu_depth == 1))//一番上の階層
{
	switch(menu_committed)
	{
		case 2: //NEXT SELECT
			menu_depth = 2;
			menu_committed = -1;//選択肢から選んだ値を元に戻す
			menu_cursor = menu_items -1;
			break;
		
		case 1://continue
			obj_player.hascontrol = true;//プレイヤーのコントロールを復活させる
			draw_check = false;//draw_guiの動作を停止してポーズ画面を消す
			menu_control = 0;//menu操作をfalseにして操作不能にする
			menu_committed = -1;//選択肢から選んだ値を元に戻す
			menu_cursor = 2;//カーソルをデフォルトの位置へ戻す
			check_escape = !check_escape;
			break;
		
		case 0:
			game_end(); break;
	}
}


if((menu_committed != -1) && (menu_depth == 2))//2番目の階層
{
	switch(menu_committed)
	{
		case 2:default: //Restart
			room_restart(); break;
			
		case 1: //Continue2
			obj_player.hascontrol = true;//プレイヤーのコントロールを復活させる
			draw_check = false;//draw_guiの動作を停止してポーズ画面を消す
			menu_control = 0;//menuの操作をfalseにして操作不能にする
			menu_committed = -1;//選択肢から選んだ値を元に戻す
			menu_items = array_length_1d(menu);
			menu_cursor = menu_items -1;
			menu_depth = 1;//メニューの階層を1に戻す
			check_escape = !check_escape;
			break;
			
		case 0://BACK
			menu_depth = 1;
			menu_items = array_length_1d(menu);
			menu_cursor = menu_items -1;
			menu_committed = -1;//選択肢から選んだ値を元に戻す
			break;
	}
}

#endregion
