
//
// Color distortion shader.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

uniform float distortionAmount; // Control the amount of distortion

void main() {
    vec4 color = texture2D(tex, v_texcoord);
    
    // Distort the color channels based on sin functions
    vec4 r = texture2D(tex, v_texcoord + vec2(sin(color.r * 10.0) * 1.6, 0.0));
    vec4 g = texture2D(tex, v_texcoord + vec2(0.0, sin(color.g * 10.0) * 1.2));
    vec4 b = texture2D(tex, v_texcoord + vec2(sin(color.b * 10.0) * 1.4, 0.0));

    gl_FragColor = vec4(r.r, g.g, b.b, color.a);
}
