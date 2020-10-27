draw_set_alpha(0.2);
draw_path(obj_sys_tracer.path,x,y,true);
draw_set_alpha(1);
draw_self();


//drawの中に組み込むためのスクリプト
//現在のインスタンスにパスがあれば表示する。