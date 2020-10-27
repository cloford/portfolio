/// @description 剣を振る（2撃目）

mysword = instance_create_layer(x,y,layer,obj_boss_mechtele_sword);
mysword.creator = id;
mysword.direction = direction;
mysword.image_angle = direction;

sword_count -= 1;

if(sword_count >= 1)
{
	alarm[1] = 147;
}