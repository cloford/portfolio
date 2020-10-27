/// @description 前後関係リストに入れつつ陰をキャスト（デフォルト：静物）

// Inherit the parent event
event_inherited();

#region shadow
// Inherit the parent event
event_inherited();

// Create a sprite polygon for this instance
polygon = polygon_from_instance(id);

// This is a static shadow caster (it never changes its polygon)
flags |= eShadowCasterFlags.Static;

ignored = false;
#endregion