precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

uniform float time;

uniform vec2 topLeft;
uniform vec2 fullSize;

void main(){
    vec4 pixColor = texture2D(tex, v_texcoord);

    gl_FragColor = vec4(1,1,1,1) - pixColor;
}

