precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);
    float dist = length(v_texcoord - vec2(0.5, 0.5));
    float vignette = smoothstep(0.7, 0.5, dist);
    gl_FragColor = vec4(pixColor.rgb * vignette, pixColor.a);
}

