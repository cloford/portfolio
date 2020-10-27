/// @description 触れるまで待機

if(check_eventstart = true) return;

if(place_meeting(x,y,obj_player) == true)
{
	event_user(0);
	check_eventstart = true;
}
