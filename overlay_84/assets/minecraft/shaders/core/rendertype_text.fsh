#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
	/* Inventory Header Color (#404040) */
	if (sphericalVertexDistance > 85.0
        && color.r > 0.250 && color.r < 0.251
        && color.g > 0.250 && color.g < 0.251
        && color.b > 0.250 && color.b < 0.251) {
        color = vec4(0.875, 0.875, 0.875, 0.875);
    }
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
