/// @description layer調整、event0

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

layer = layer_get_id("lay_inventory");

event_user(0);