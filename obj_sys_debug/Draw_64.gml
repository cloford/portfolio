if(mode_debug == false)
{
	return;
}

draw_set_color(c_white);
draw_text(100,300,debug1);
draw_text(100,320,debug2);
draw_text(100,340,debug3);

draw_text(100,40,global.debug1);
draw_text(100,60,obj_sys_manager.file_csv_item[# 2,2]);
draw_text(100,600,string("GUI : ") + string(display_get_gui_width()));
draw_text(100,620,string("D : ") + string(display_get_width()));
draw_text(100,640,string("DPI : ") + string(display_get_dpi_x()));

draw_text(100,global.gui_h-100,keyboard_string);