//フロア用のレイヤーが無ければインスタンスレイヤーより下にレイヤーを生成する
if(layer_exists("lay_floor") == false)
{
	layer_create(10,"lay_floor");
}
layer = layer_get_id("lay_floor");