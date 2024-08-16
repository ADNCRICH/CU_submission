#version 330 core

layout (location = 0) in vec3 aPos;

uniform vec3 rot;

void main(){
    float z_x = rot.x, z_y = rot.y, z_z = rot.z;
    mat4 view_x = mat4(1.0f, 0.0f, 0.0f, 0.0f,
                       0.0f, cos(z_x), -sin(z_x), 0.0f,
                       0.0f, sin(z_x), cos(z_x), 0.0f,
                       0.0f, 0.0f, 0.0f, 1.0f);
    mat4 view_y = mat4(cos(z_y), 0.0f, sin(z_y), 0.0f,
                          0.0f, 1.0f, 0.0f, 0.0f,
                          -sin(z_y), 0.0f, cos(z_y), 0.0f,
                          0.0f, 0.0f, 0.0f, 1.0f);  
    mat4 view_z = mat4(cos(z_z), -sin(z_z), 0.0f, 0.0f,
                            sin(z_z), cos(z_z), 0.0f, 0.0f,
                            0.0f, 0.0f, 1.0f, 0.0f,
                            0.0f, 0.0f, 0.0f, 1.0f);
    // gl_Position = vec4(aPos, 5.0);
    gl_Position = view_z * view_y * view_x * vec4(aPos, 5.0);
}