
//
// Whirl effect shader.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time; // Time variable for animation

void main() {
    vec2 center = vec2(0.5, 0.5);
    vec2 uv = v_texcoord - center;
    
    // Apply a whirl effect
    float angle = atan(uv.y, uv.x) + sin(time) * 1.0;
    float radius = length(uv);
    
    uv = vec2(cos(angle), sin(angle)) * radius;
    gl_FragColor = texture2D(tex, uv + center);
}
