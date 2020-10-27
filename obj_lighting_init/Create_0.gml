/// @desc Init lighting

lighting_global();

gpu_set_tex_repeat(false);

//事前準備
//layerを生成
if(layer_exists("lay_light") == false) layer_create(-100,"lay_light");
layer = layer_get_id("lay_light");
//レンダラーを生成
instance_create_layer(x,y,layer,obj_light_renderer);