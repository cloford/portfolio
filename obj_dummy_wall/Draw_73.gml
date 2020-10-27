/*
壁にプレイヤーが記憶したかどうかの変数を覚えてもらう
マウスで視界を取って、視界が取れた部分は記憶変数をtrueにする
視界を外した後も、記憶変数がtrueの壁は半透明で上のレイヤーに描画する
*/
if(remembered == false) return;

draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_white, 0.1);