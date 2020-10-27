//isopen = false;

x = global.outer_world;
y = global.outer_world;

if(layer_exists("lay_inventory") == false)
{
	layer_create(-110,"lay_inventory");
}

if(layer_exists("lay_inventory_item") == false)
{
	layer_create(-120,"lay_inventory_item");
}

if(layer_exists("lay_gui_drag") == false)
{
	layer_create(-130, "lay_gui_drag");
}

if (room == rm_shop) or (room == rm_sellshop)
{
	in_shop = true;
}
else
{
	in_shop = false;
}