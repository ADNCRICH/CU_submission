#version 330 core

out vec4 FragColor;
in vec2 TexCoords;

uniform sampler2D ourTexture;
in float Time;

#define RED vec3(193.0,18.0,28.0) / 255.
#define BLACK vec3(1., 1., 1.) / 255.
#define GOLD vec3(238., 201., 0.) / 255.

vec3 Flag(vec2 U){
    vec3 col = mix(RED, BLACK, smoothstep(0.663, 0.666, U.y));
    return mix(GOLD, col, smoothstep(0.330, 0.333, U.y));
}

float vignette(vec2 U){
    return 16.0 * U.x * (1.0 - U.x) * U.y * (1.0 - U.y);
}

void main(){
    float iTime = Time / 1.5;
    vec2 uv = TexCoords ;

    float t = uv.x * 7.0 - 6.0 * iTime + uv.y * 6.0;
    uv.y += sin(t) * 0.0125;

    vec3 col = Flag(uv);
    // vec3 col = vec3(1.0, 1.0, 1.0);

    col += sin(t) * 0.25; // highlights
    col *= 0.7 + cos(t) * 0.3; // shadows

    col *= 1.0 - 0.6 * exp2(-1.75 * vignette(uv)); // vignette
    
    // FragColor = vec4(col, 1.0);
    // FragColor = texture(ourTexture, TexCoords);

    FragColor = mix(vec4(col, 1.0), texture(ourTexture, TexCoords), smoothstep(0.45f, 0.55f, sin(Time/2)/2 + 0.5f));
}