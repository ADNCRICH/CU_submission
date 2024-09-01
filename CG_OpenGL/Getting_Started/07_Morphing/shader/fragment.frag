#version 330 core

out vec4 FragColor;
in vec2 TexCoord;

uniform sampler2D ourTexture;

void main(){
// FragColor = vec4(1.0f, 0.5f, 0.2f, 0.7f);
FragColor = texture(ourTexture, TexCoord);
}