
//
// Abstract art shader with multiple effects.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

void main() {
    vec2 uv = v_texcoord;

    // Create circular patterns
    float pattern = sin(length(uv - 0.5) * 10.0 - time * 2.0) * 0.5 + 0.5;

    // Sample the texture
    vec4 color = texture2D(tex, uv);
    
    // Add color based on pattern
    gl_FragColor = vec4(color.r * pattern, color.g * (1.0 - pattern), color.b, color.a);
}
