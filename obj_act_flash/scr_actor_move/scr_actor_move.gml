/// @desc x_speedとy_speedから、壁へのcollisionチェック及び実際の移動を行う。
/// @param xs x_speed
/// @param ys y_speed

var xs = argument0;
var ys = argument1;

//移動するとしたら、x軸がsolidに触れるか
if (place_free(x + xs,y) == false)
{
	while (place_free(x + sign(xs),y)) //スキマが無くなるまでx座標を壁に詰める
	{
		x = x + sign(xs);//xにsign(x_speed)を足した分だけ移動する
	}
	xs = 0;
}

//移動するとしたら、y軸がsolidに触れるか
if (place_free(x,y + ys) == false)
{
	while (place_free(x,y + sign(ys))) //スキマが無くなるまでy座標を壁に詰める
	{
		y = y + sign(ys);
	}
	ys = 0;
}

//実際の座標を更新
x = x + xs;
y = y + ys;