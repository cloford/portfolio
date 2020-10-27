//損傷の描画

if(hit_point <= hit_point_cap)
{
	var hp_gap = hit_point_cap - hit_point;
	for(var i = 0; i < hp_gap; i += 1)
	{
		draw_text(x+40,y-(i*10),"x")
	}
}