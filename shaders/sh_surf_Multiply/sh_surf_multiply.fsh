//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D u_sampler;


void main()
{
	vec4 source		= texture2D( gm_BaseTexture	, v_vTexcoord );//基本色   
	vec4 composit	= texture2D( u_sampler		, v_vTexcoord );//合成色   
//	gl_FragColor = (source * composit);
//	gl_FragColor = (source + composit) - (source * composit);
//	gl_FragColor = (composit);
	gl_FragColor = (source * composit);
}