//数フレーム目になにかしたい場合はこのイベントをトリガーにアラームイベントを起動させる。
/// @description 狙撃弾



mybullet				= instance_create_layer(x,y,layer,obj_bullet_sekizo);
mybullet.creator		= creator;
mybullet.team			= team;
mybullet.cast_time		= cast_time;
mybullet.bullet_speed	= bullet_speed;
mybullet.damage			= damage;
mybullet.direction		= direction;
mybullet.skill_range	= 1920;
mybullet.image_angle	= mybullet.direction;
with(mybullet) event_user(0);