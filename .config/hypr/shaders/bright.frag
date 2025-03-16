precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const float brightnessFactor = 1.2;

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);

    pixColor[0] *= brightnessFactor;
    pixColor[1] *= brightnessFactor;
    pixColor[2] *= brightnessFactor;

    pixColor = clamp(pixColor, 0.0, 1.0);


    gl_FragColor = pixColor;
}

