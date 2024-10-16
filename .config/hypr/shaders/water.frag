
//
// Very subtle water ripple effect shader using multiple sine functions.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex; // Texture uniform
uniform float time;

void main() {
    vec2 uv = v_texcoord;

    // Create a very subtle ripple effect using multiple sine functions
    float rippleX = 0.001 * (
        sin(uv.y * 5.0 + time * 0.5) +
        sin(uv.y * 10.0 + time * 1.0) +
        sin(uv.y * 15.0 + time * 1.5) +
        sin(uv.y * 20.0 + time * 2.0) +
        sin(uv.y * 25.0 + time * 2.5) +
        sin(uv.y * 30.0 + time * 3.0) +
        sin(uv.y * 35.0 + time * 3.5) +
        sin(uv.y * 40.0 + time * 4.0) +
        sin(uv.y * 45.0 + time * 4.5) +
        sin(uv.y * 50.0 + time * 5.0)
    );
    
    float rippleY = 0.001 * (
        cos(uv.x * 5.0 + time * 0.5) +
        cos(uv.x * 10.0 + time * 1.0) +
        cos(uv.x * 15.0 + time * 1.5) +
        cos(uv.x * 20.0 + time * 2.0) +
        cos(uv.x * 25.0 + time * 2.5) +
        cos(uv.x * 30.0 + time * 3.0) +
        cos(uv.x * 35.0 + time * 3.5) +
        cos(uv.x * 40.0 + time * 4.0) +
        cos(uv.x * 45.0 + time * 4.5) +
        cos(uv.x * 50.0 + time * 5.0)
    );

    uv.x += rippleX;
    uv.y += rippleY;

    vec4 color = texture2D(tex, uv);
    gl_FragColor = color; // Output the color with subtle ripples
}
