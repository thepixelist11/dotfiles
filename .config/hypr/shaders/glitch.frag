precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec2 tc = v_texcoord;

    // Randomly offset the texture coordinates
    float yOffset = mod(gl_FragCoord.y, 5.0); // Using float for mod
    if (yOffset < 1.0) {
        tc.x += (fract(sin(gl_FragCoord.y) * 43758.5453) * 0.01); // Random horizontal offset
    }

    vec4 color = texture2D(tex, tc);
    gl_FragColor = color;
}
