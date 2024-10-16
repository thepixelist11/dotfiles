
precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    // Calculate the pixelated texture coordinates
    vec2 coord = floor(v_texcoord * 300.0) / 300.0;
    
    // Fetch the color from the texture using the modified coordinates
    vec4 pixColor = texture2D(tex, coord);
    
    // Set the fragment color
    gl_FragColor = pixColor;
}
