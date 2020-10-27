/// @description 
//基本的な仕組み：
//bulletはdamageやその他必要な変数を保持する
//bulletにcast_timeがあるなら、castが終わるまで弾の本体は現れない
//本体が現れたら、それがactorにぶつかるまで前進などする
//actorにぶつかったら、actor側でdamageやその他変数を受け取る。
//※bullet側から渡す場合、シールドの処理などが複雑になるため
//TODO: 弾が着弾時に破壊されるかされないかの種類（破壊されないbeamも作る）
//TODO: 破壊されないなら、同じbulletから二度以上ダメージを受けないように
//TODO: bullet_parentのようなものを定義する

if(instance_exists(creator) == false) instance_destroy();

cast_count -= 1;

//発射後の処理
if(cast_count <= 0)
{
	//発射した瞬間の1step処理
	if(check_fire == false)
	{
		//sound関連
		audio_emitter_position(myemitter, x, y, 0);
		scr_sound_save(900, creator, "fire",x,y);
		audio_emitter_falloff(myemitter, 50, 900, 1); //音声の距離減衰 id, 減衰開始距離, 最大距離, 係数
		audio_play_sound_on(myemitter, se_footstep, false, global.se_priority); //SE再生
		check_fire = true;
		
		//弾体発射
		speed = bullet_speed;
	}
	
	image_angle = direction;
	
	//solidオブジェクトに触れたら
	if(place_free(x,y) == false)
	{
		instance_destroy();
	}
}