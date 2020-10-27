lx += sin(current_time / 100) * 10;

if(!surface_exists(surf))
{
	var w = 300;
	var h = 300;
   surf = surface_create(w, h);
}

surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	draw_set_color(c_blue);
	draw_circle(lx, ly, 10, false);
	draw_set_color(c_white);
surface_reset_target();

draw_surface(surf, 50, 50);