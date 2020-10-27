//使用例
//scr_tracer(obj_player.x,obj_player.y,5);


//このスクリプトを使用する場合、scr_tracer(target_x,target_y,speed)で定義する
if(mp_grid_path(obj_sys_tracer.grid,obj_sys_tracer.path,x,y,argument0,argument1,true))
//自身の位置からターゲットまでのパスがつながっている場合のみ実行する
{
	path_start(obj_sys_tracer.path,argument2,path_action_stop,false);
	//stepごとに生成されたパスを3ずつ辿る
}
