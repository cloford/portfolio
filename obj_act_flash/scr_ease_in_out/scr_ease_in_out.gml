/// ease_in_out(時間, 開始位置, 終了位置, 経過時間)

var t = argument[0]; //time
var b = argument[1]; //start
var c = argument[2]; //dest
var d = argument[3]; //duration

t /= d/2;
if (t < 1) return c/2*t*t + b;
t--;

return -c/2 * (t * (t-2) -1) + b;