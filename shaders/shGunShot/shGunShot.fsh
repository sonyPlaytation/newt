//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;


void main()
{
    vec4 sampled_color = texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord ) + vec4(0.50,0.50,0.50,0.0);
}
