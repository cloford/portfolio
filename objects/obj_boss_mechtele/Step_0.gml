/// @description Insert description here
// You can write your code in this editor
switch(mode)
{
	//playerの方へ向く
	case "sword_prepare":
		var to_dir = point_direction(x, y, target.x, target.y - (target.sprite_height /2) );
		var diff = angle_difference(to_dir,direction);
		direction += (min(abs(diff / 10), 10) * sign(diff));
	break;
}

//角度に応じてスプライトを8方向変える。
//direction（-360～360）に22.5足して、45で割ったものを四捨五入し、
//それを8で割ったあまり（0～7）がそのままsubimage番号になる。
var angle_d = (floor( ((direction) + 22.5) / (45))) % 8;
image_index = angle_d;