#version 450

layout (location = 0) in vec3 vPosition;
layout (location = 1) in vec3 vColor;
layout (location = 2) in vec3 vNormal;
layout (location = 3) in vec2 vUVCoord;

layout (location = 0) out vec3 fColor;
layout (location = 1) out vec2 fTexCoord;

layout(binding = 0) uniform UniformBufferObject
{
    mat4 mvp;
} ubo;

layout( push_constant ) uniform constants
{
	vec4 data;
	mat4 mvp;
} PushConstants;

void main() 
{	
	gl_Position = ubo.mvp * vec4(vPosition, 1.0f) + vec4(-4.0f + 4 * float(gl_InstanceIndex), .0f, .0f, 1.0f);
	fColor = vNormal;
    fTexCoord = vUVCoord;
}

