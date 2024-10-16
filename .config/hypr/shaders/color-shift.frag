
//
// Color shifting shader.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time; // Time variable for animation

void main() {
    vec4 color = texture2D(tex, v_texcoord);
    
    // Shift colors based on sine wave
    float shiftAmount = sin(time + v_texcoord.y * 10.0) * 0.01;
    
    gl_FragColor = vec4(
        texture2D(tex, v_texcoord + vec2(shiftAmount, 0.0)).r,
        texture2D(tex, v_texcoord).g,
        texture2D(tex, v_texcoord - vec2(shiftAmount, 0.0)).b,
        color.a
    );
}
