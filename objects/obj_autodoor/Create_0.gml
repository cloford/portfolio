/// @desc Create shadow caster polygon

image_xscale = 15;
image_yscale = 4;

// Inherit the parent event
event_inherited();

// Create a sprite polygon for this instance
polygon = polygon_from_instance(id);

// This is a static shadow caster (it never changes its polygon)
flags |= eShadowCasterFlags.Static;

ignored = false;