
sprite_delete(mask_spr);

for (var i = 0; i < slot_height; i += 1)
{
	sprite_delete(gen_spr[i]);
}

surface_free(equipment_surf);