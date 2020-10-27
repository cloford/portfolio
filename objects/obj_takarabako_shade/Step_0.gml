/// @description Insert description here
// You can write your code in this editor

//TODO 近くに二つ以上インタラクト対象があると、生成が先の方が優先されるが
//近いほうを優先したい。
//また、今Fを押したらインタラクトする対象は誰か明示するために
//インタラクト選択対象を光らせるなどしたい（shaderで）

if(obj_player.key_intract == true)
{
	//3dot以内かつインタラクト先が未登録ならインタラクト開始
	if(distance_to_object(obj_player) <= 3) and (obj_player.intract_to == noone) 
	{
		image_index = 1;
		obj_player.hascontrol		= false;
		obj_player.intract_to		= id;
		with(obj_player) event_user(1);
	}
}