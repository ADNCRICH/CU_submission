#version 330 core
out vec4 FragColor;

in vec2 TexCoords;
in vec3 FragPos;

uniform sampler2D texture_diffuse1;

uniform float X;
uniform float Y;
uniform float Z;
uniform float C;
uniform float D;

void main()
{    
    // if (FragPos.x > 0)
    //     discard;
    if(abs(FragPos.x * X + FragPos.y * Y + FragPos.z * Z + C) > D/2)
        discard;
    FragColor = texture(texture_diffuse1, TexCoords);
        
}