gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

menu_x = gui_width / 2;
menu_y = gui_height / 2;
menu_font = fnt_menu;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = 0;

//menu[3] = "ssssss7"
menu[2] = "NEXT SELECT";
menu[1] = "Continue";
menu[0] = "Quit Game";

menu_option[3] = "RESTRAT2";
menu_option[2] = "RESTRAT";
menu_option[1] = "Continue2";
menu_option[0] = "BACK";


menu_cursor = 2;
menu_items = array_length_1d(menu); //menu[]で設定したサイズをmenuの個数として扱う
menu_option_size = array_length_1d(menu_option); 

//-----------debug関数（後ですべて消す）------------------
count1 = 0;
//------追加------
check_escape = false;//escapeキーの切り替えスイッチ
draw_check = false;//draw_guiの起動スイッチ
menu_depth = 1;//draw_GUIで、どのメニューを表示するかのスイッチ


click_rect_y[3] = 0;
click_rect_y[2] = 0;
click_rect_y[1] = 0;
click_rect_y[0] = 0;