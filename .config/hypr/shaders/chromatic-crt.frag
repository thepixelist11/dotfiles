precision mediump float;
varying vec2 v_texcoord;

uniform sampler2D tex;

#define STRENGTH 0.0027

void main() {
    vec2 center = vec2(0.5, 0.5);

    // Distortion calculation
    vec2 offset = (v_texcoord - center) * STRENGTH;
    float rSquared = dot(offset, offset);
    float distortion = 1.0 + 1.0 * rSquared;
    vec2 distortedOffset = offset * distortion;

    // Texture coordinates after distortion
    vec2 tc = v_texcoord + distortedOffset;

    // Distance from the center for scanline effect
    float dx = abs(0.5 - tc.x);
    float dy = abs(0.5 - tc.y);

    // Smooth the edges
    dx *= dx;
    dy *= dy;

    // Adjust texture coordinates for the scanline effect
    tc.x -= 0.5;
    tc.x *= 1.0 + (dy * 0.03);
    tc.x += 0.5;

    tc.y -= 0.5;
    tc.y *= 1.0 + (dx * 0.03);
    tc.y += 0.5;

    // Retrieve colors with offsets
    vec4 redColor = texture2D(tex, v_texcoord + distortedOffset);
    vec4 blueColor = texture2D(tex, tc);

    // Apply scanline effect
    blueColor.rgb += sin(tc.y * 1250.0) * 0.02;

    // Cutoff for out-of-bounds coordinates
    if(tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0 || tc.y < 0.0) {
        blueColor = vec4(0.0);
    }

    // Combine colors into final output
    gl_FragColor = vec4(redColor.r, blueColor.g, blueColor.b, 1.0);
}
