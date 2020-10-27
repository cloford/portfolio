/// @description Insert description here
// You can write your code in this editor

light[| eLight.Direction] = creator.neck_direction;
light[| eLight.X] = creator.x;
light[| eLight.Y] = creator.y - (creator.sprite_height / 2);
light[| eLight.Flags] |= eLightFlags.Dirty; // rebuild static shadow casters