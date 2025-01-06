precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

void main() {
    vec2 wave = v_texcoord + vec2(0.02 * sin(1.0 * v_texcoord.y + time), 0.02 * cos(1.0 * v_texcoord.x + time));
    gl_FragColor = texture2D(tex, wave);
}
