precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform sampler2D bloomTex; // A blurred texture of the bright areas

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);

    vec4 bloomColor =
        texture2D(bloomTex, v_texcoord + vec2(-1.0, -1.0) / 512.0) +
        texture2D(bloomTex, v_texcoord + vec2( 0.0, -1.0) / 512.0) +
        texture2D(bloomTex, v_texcoord + vec2( 1.0, -1.0) / 512.0) +
        texture2D(bloomTex, v_texcoord + vec2(-1.0,  0.0) / 512.0) +
        texture2D(bloomTex, v_texcoord + vec2( 1.0,  0.0) / 512.0) +
        texture2D(bloomTex, v_texcoord + vec2(-1.0,  1.0) / 512.0) +
        texture2D(bloomTex, v_texcoord + vec2( 0.0,  1.0) / 512.0) +
        texture2D(bloomTex, v_texcoord + vec2( 1.0,  1.0) / 512.0);

    bloomColor /= 9.0;

    gl_FragColor = pixColor + bloomColor * 0.3;

    gl_FragColor = clamp(gl_FragColor, 0.0, 1.0);
}
