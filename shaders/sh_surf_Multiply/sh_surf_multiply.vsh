


attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec2  v_vTexcoord;

uniform float u_ratio;

void main()
{
    vec4 pos    = vec4( in_Position, u_ratio);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * pos;   
    v_vTexcoord = in_TextureCoord;
}