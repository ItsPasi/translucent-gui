#version 150

// Can't moj_import in things used during startup, when resource packs don't exist.
// This is a copy of dynamicimports.glsl
layout(std140) uniform DynamicTransforms {
    mat4 ModelViewMat;
    vec4 ColorModulator;
    vec3 ModelOffset;
    mat4 TextureMat;
    float LineWidth;
};

in vec4 vertexColor;

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
