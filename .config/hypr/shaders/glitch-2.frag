precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

void main() {
    vec2 uv = v_texcoord;

    // Random horizontal displacement for glitch effect
    float glitchAmount = 0.05 * sin(time * 5.0);
    
    // Create glitch effect using float for mod
    float lineOffset = mod(gl_FragCoord.y, 4.0);
    if (lineOffset < 1.0) {
        uv.x += (fract(sin(gl_FragCoord.y * 0.1 + time) * 10000.0) - 0.5) * glitchAmount;
    }

    vec4 color = texture2D(tex, uv);
    gl_FragColor = vec4(color.r + 0.2 * (sin(time) * 0.5), color.g, color.b, color.a);
}
