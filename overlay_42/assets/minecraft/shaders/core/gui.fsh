#version 150

in vec4 vertexColor;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) {
        discard;
    }
	/* Sodium checkbox colour */
	if (color == vec4(0.5803921568627451, 0.8941176470588236, 0.8274509803921568, 1)){
		color = vec4(0.8, 0.8, 0.8, 1);
	}
    fragColor = color * ColorModulator;
}