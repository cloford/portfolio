/// @description 必要なobjを生成

//経路管理
if(instance_exists(obj_sys_tracer) == false)
{
	instance_create_layer(global.outer_world,global.outer_world,layer,obj_sys_tracer);
}

//サウンド管理
if(instance_exists(obj_sys_sound) == false)
{
	instance_create_layer(global.outer_world,global.outer_world,layer,obj_sys_sound);
}

//カメラ管理
if(instance_exists(obj_sys_camera) == false)
{
	instance_create_layer(global.outer_world,global.outer_world,layer,obj_sys_camera);
}