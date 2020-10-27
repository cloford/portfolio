/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y,obj_player)
{
	do obj_player.y -= 0.1
	until (!place_meeting(x,y,obj_player))
}