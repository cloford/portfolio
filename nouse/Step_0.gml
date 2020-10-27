/// @description Insert description here
// You can write your code in this editor

light[| eLight.Direction] = obj_player.direction;
light[| eLight.X] = obj_player.x;
light[| eLight.Y] = obj_player.y - (obj_player.sprite_height / 2);
light[| eLight.Flags] |= eLightFlags.Dirty; // rebuild static shadow casters