/// @description Insert description here
// TODO: キャラスプライト変えた方が早くね？

x = obj_player.x;
y = obj_player.y-9;



switch (obj_player.direction)
{
	case 0:		image_xscale = -1 x = x+3 break;
	case 90:	image_xscale = -1 x = x+7 break;
	case 180:	image_xscale = 1 x = x-2 depth = obj_player.depth +1; break;
	case 270:	image_xscale = 1 x = x-5 break;
}