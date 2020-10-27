//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 u_p;				//点u_pの座標
uniform sampler2D u_sampler;

void main()
{
	//正規化により、点pは画面中央を0とする-1～1の座標系を示すことができる。
	vec2 p = (gl_FragCoord.xy * 1.0 - u_p) / (u_resolution.y);
	//float l = 0.1 / length(p); //点pからの距離に応じて、変数lの値を変える。
	//つまり、円の範囲（左項）までは1、最も遠い点は0（真っ暗）でグラデーションする。
	
	float l = 0.005 / (length(p) * length(p));
	
	gl_FragColor = vec4(vec3(l), 1.0);
}
