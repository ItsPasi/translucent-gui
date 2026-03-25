#version 150

in vec4 vertexColor;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) {
        discard;
    }
	/* checks for background colour */
    if (color.r == 16/255.0 && color.g == 0/255.0 && color.b == 16/255.0 ) {
        color = vec4(0, 0, 0, 0.8);
    }
    /* checks for border colours */
    if (color.r >= 0.15686 && color.r <= 0.31373 && color.g == 0 && color.b >= 0.49 && color.b <= 1) { 
        color = vec4(0, 0, 0, 0);
    }
	/* Sodium checkbox colour */
	if (color == vec4(0.5803921568627451, 0.8941176470588236, 0.8274509803921568, 1)){
		color = vec4(0.8, 0.8, 0.8, 1);
	}
    fragColor = color * ColorModulator;
}