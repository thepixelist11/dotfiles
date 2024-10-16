//
// VHS effect shader.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time; // Declare time uniform

void main() {
    vec2 tc = v_texcoord;

    // Add a slight distortion
    tc.y += sin(tc.x * 10.0 + time * 5.0) * 0.005; // Simulate tracking errors

    vec4 color = texture2D(tex, tc);

    // Simulate color bleeding
    vec4 r = texture2D(tex, tc + vec2(0.005, 0.0));
    vec4 g = texture2D(tex, tc);
    vec4 b = texture2D(tex, tc - vec2(0.005, 0.0));

    gl_FragColor = vec4(r.r, g.g, b.b, color.a) * 0.9; // Combine colors with a little desaturation
}
