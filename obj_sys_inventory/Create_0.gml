///@desc インベントリを開いた時に生まれるobj

init_end	= false;
can_drop	= false; //インベントリにドロップできるか
can_stack	= false; //スタックできるか。
can_move	= false; //alt+clickで移動チェックに成功したか
moveto		= noone; //自動移動対象
mode_drag	= false;
mode_click	= false;
in_inv_box	= false;



//これ以外は全部user_event 0に