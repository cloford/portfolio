//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 u_resolution;
uniform float u_time;
uniform vec2 u_p;
uniform sampler2D u_sampler;

/*
//		全面緑色
void main()
{
    gl_FragColor = vec4(0.0, 1.0, 0.0, 1.0);
}
*/

/*
//	横グラデ
void main(void){
    float a = gl_FragCoord.x / u_resolution.y;
    gl_FragColor = vec4(vec3(a), 1.0);
}
*/

/*
//	縦グラデ、winでは上が黒
void main(void){
    float a = gl_FragCoord.y / u_resolution.y;
    gl_FragColor = vec4(vec3(a), 1.0);
}
*/

/*
//		白い円を中心に描画
void main()
{
    vec2 p = (gl_FragCoord.xy * 2.0 - u_resolution) / min(u_resolution.x, u_resolution.y); // 正規化
	//正規化により、点pは画面中央を0とする-1～1の座標系を示すことができる。
	float l = 0.1 / length(p); //点pからの距離に応じて、変数lの値を変える。
	gl_FragColor = vec4(vec3(l), 1.0);
//	float a = gl_FragCoord.y / u_resolution.y;
//	gl_FragColor = vec4(vec3(a), 1.0);
}
*/


//白い円が5つ、回転する。 winでは時計回り
void main()
{
    vec2 p = (gl_FragCoord.xy * 2.0 - u_resolution) / (u_resolution.y); // 正規化
    vec3 destColor = vec3(0.0);
    for(float i = 0.0; i < 5.0; i++)
	{
        float j = i + 1.0;
        vec2 q = p + vec2(cos(u_time * j), sin(u_time * j)) * 0.5;
        destColor += 0.05 / length(q);
    }
    gl_FragColor = vec4(destColor, 1.0);
}

