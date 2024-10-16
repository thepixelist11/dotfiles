precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex; // Texture uniform
uniform float time;

float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}

float fbm(vec2 st) {
    float total = 0.0;
    float frequency = 1.0;
    float amplitude = 0.5;
    for (int i = 0; i < 5; i++) {
        total += noise(st * frequency) * amplitude;
        frequency *= 2.0;
        amplitude *= 0.5;
    }
    return total;
}

void main() {
    vec2 uv = v_texcoord;
    float n = fbm(uv * 5.0 + time * 0.5); // Scale and animate the noise
    vec4 color = texture2D(tex, uv);
    
    // Mix the original color with the noise subtly
    gl_FragColor = mix(color, vec4(vec3(n), 1.0), 0.1); // Adjust blend factor for subtlety
}
