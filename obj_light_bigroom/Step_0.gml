/// @description Insert description here
// You can write your code in this editor

if(lightstart == true) and (lightint <= 3)
{
	lightint += 0.1;
	light[| eLight.Intensity] = lightint;
}