/// @description alt+D でdebug mode

if(keyboard_check(vk_alt)) and (keyboard_check_pressed(ord("D")))
{
    mode_debug = !mode_debug;
    keyboard_string = "";
}

//alt+P restart
if(keyboard_check(vk_alt)) and (keyboard_check_pressed(ord("P")))
{
    game_restart();
}




if(mode_debug == false)
{
    return;
}

if(keyboard_check_pressed(vk_enter))
{
    //guitestを開始
    if(keyboard_string == string("guitest")) obj_gui_manager.guitest = true;

    //moneyを5000追加
    if(keyboard_string == string("plzmoney")) obj_rm_hideout.money += 5000;

    if(keyboard_string == string("gonext")) room_goto_next();

    if(keyboard_string == string("nolight")) //ライト無効化
    {
        with(obj_light) instance_destroy();
        with(obj_light_renderer) instance_destroy();
        lighting_free();
    }

    if (string_copy(keyboard_string,1,3) == "go ") //$go moveroom
    {
        keyboard_string = string_delete(keyboard_string,1,3); //delete flag
        var trm = asset_get_index(string(keyboard_string))
        if(room_exists(trm))
        {
            room_goto(trm);
        }
    }

    keyboard_string = "";
}