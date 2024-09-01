#include<glad/glad.h>
#include<GLFW/glfw3.h>
#include<bits/stdc++.h>
#include<filesystem>
#include <../../shader_s.h>
#define STB_IMAGE_IMPLEMENTATION
#include "/usr/local/include/libstb/stb_image.h"
using namespace std;

string loadFile(const string& fname);
void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void processInput(GLFWwindow *window);
int idxx = 0, ch = 0;
int image_idx = 1;

int main(){

    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    GLFWwindow* window = glfwCreateWindow(800, 600, "Hello Triangle", NULL, NULL);
    if(window == NULL){
        cout << "Failed to create GLFW window" << endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);

    if(!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)){
        cout << "Failed to initialize GLAD" << endl;
        return -1;
    }

    Shader ourShader("./shader/vertice.vert", "./shader/fragment.frag"); 

    // float vertices[] = {
    //      0.5f,  0.5f, 0.0f,  // top right
    //      0.5f, -0.5f, 0.0f,  // bottom right
    //     -0.5f, -0.5f, 0.0f,  // bottom left
    //     -0.5f,  0.5f, 0.0f   // top left 
    // };
    // unsigned int indices[] = {
    //     0, 1, 3,
    //     1, 2, 3
    // };
    float gr = (1 + sqrt(5)) / 2;
    float sq = sqrt(2);
    float vertices[] = {
        0, 1, gr,   // 0
        0, 1, -gr,  // 1
        0, -1, gr,  // 2
        0, -1, -gr, // 3
        1, gr, 0,   // 4
        1, -gr, 0,  // 5
        -1, gr, 0,  // 6
        -1, -gr, 0, // 7
        gr, 0, 1,   // 8
        gr, 0, -1,  // 9
        -gr, 0, 1,  // 10
        -gr, 0, -1  // 11
    };
    float vertices_c[] = {
        0, sq, 1,   // 0
        0, sq, -1,  // 1
        0, -sq, 1,  // 2
        0, -sq, -1, // 3
        sq, 0, 0,   // 4          // rotate cloclwise 45 degree and fit clostest
        0, -sq, 0,  // 5
        0, sq, 0,   // 6
        -sq, 0, 0,  // 7
        sq, 0, 1,   // 8
        sq, 0, -1,  // 9
        -sq, 0, 1,  // 10
        -sq, 0, -1, // 11
    };
    float vertices_c2[] = {
        0, sq, 1, 1, 1,
        0, -sq, 1, 0, 0,
        sq, 0, 1, 1, 0,

        0, sq, 1, 1, 1,
        -sq, 0, 1, 0, 1,
        0, -sq, 1, 0, 0,

        0, sq, 1, 0, 1,
        sq, 0, 1, 0, 0,
        sq, 0, 0, 0.5, 0,

        0, sq, 1, 1, 1,
        0, sq, 0, 0.5, 1,
        -sq, 0, 1, 1, 0,

        0, sq, 1, 0, 1,
        sq, 0, 0, 0.5, 0,
        0, sq, 0, 0.5, 1,

        0, -sq, 1, 0, 0,
        0, -sq, 0, 0.5, 0,
        sq, 0, 1, 0, 1,

        0, -sq, 1, 1, 0,
        -sq, 0, 1, 1, 1,
        -sq, 0, 0, 0.5, 1,

        0, -sq, 0, 0.5, 0,
        0, -sq, 1, 1, 0,
        -sq, 0, 0, 0.5, 1,

        sq, 0, 0, 0.5, 0,
        0, sq, -1, 1, 1,
        0, sq, 0, 0.5, 1,

        sq, 0, 1, 0, 0.5,
        sq, 0, -1, 1, 0.5,
        sq, 0, 0, 0.5, 1,

        sq, 0, 1, 0, 1,
        0, -sq, 0, 0.5, 0,
        sq, 0, -1, 1, 1,

        -sq, 0, 1, 1, 0,
        0, sq, 0, 0.5, 1,
        -sq, 0, -1, 0, 0,

        -sq, 0, 1, 1, 0.5,
        -sq, 0, -1, 0, 0.5, 
        -sq, 0, 0, 0.5, 0,

        sq, 0, 0, 0.5, 0,
        sq, 0, -1, 1, 0,
        0, sq, -1, 1, 1,

        0, -sq, 0, 0.5, 0,
        0, -sq, -1, 1, 0,
        sq, 0, -1, 1, 1,

        0, sq, 0, 0.5, 1,
        0, sq, -1, 0, 1,
        -sq, 0, -1, 0, 0,

        -sq, 0, 0, 0.5, 1,
        -sq, 0, -1, 0, 1,
        0, -sq, -1, 0, 0,

        0, sq, -1, 0, 1,
        sq, 0, -1, 0, 0,
        0, -sq, -1, 1, 0,

        0, sq, -1, 0, 1,
        0, -sq, -1, 1, 0,
        -sq, 0, -1, 1, 1,

        0, -sq, 0, 0.5, 0,
        -sq, 0, 0, 0.5, 1,
        0, -sq, -1, 0, 0,
    };
    float tex_uv[] = {
        1, 1,
        0, 1,
        0, 0,
        1, 1,
        0.5, 0,
        0.5, 0,
        0.5, 1,
        0.5, 1,
        1, 0,
        0, 0,
        0, 1,
        1, 1,
    };
    unsigned int N = 60;
    unsigned int indices[] = {
        0, 2, 8, 
        0, 10, 2,
        0, 8, 4,
        0, 6, 10,
        0, 4, 6,
        2, 5, 8,
        2, 10, 7,
        5, 2, 7,
        4, 1, 6,
        8, 9, 4,
        8, 5, 9,
        10, 6, 11,
        10, 11, 7,
        4, 9, 1, 
        5, 3, 9,
        6, 1, 11,
        7, 11, 3,
        1, 9, 3,
        1, 3, 11, 
        5, 7, 3,

        // 4, 6, 2
    };
    unsigned int indices2[] = {
        0, 1, 2,
        3, 4, 5,
        6, 7, 8,
        9, 10, 11,
        12, 13, 14,
        15, 16, 17,
        18, 19, 20,
        21, 22, 23,
        24, 25, 26,
        27, 28, 29,
        30, 31, 32,
        33, 34, 35,
        36, 37, 38,
        39, 40, 41,
        42, 43, 44,
        45, 46, 47,
        48, 49, 50,
        51, 52, 53,
        54, 55, 56,
        57, 58, 59,
    };

    GLuint VAO, VBO_1, VBO_2, EBO;

    glGenBuffers(1, &EBO);

    glGenVertexArrays(1, &VAO); 
    glGenBuffers(1, &VBO_1);
    glGenBuffers(1, &VBO_2);

    glBindVertexArray(VAO);

    /*glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

    glBindBuffer(GL_ARRAY_BUFFER, VBO_1);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);

    glBindBuffer(GL_ARRAY_BUFFER, VBO_2);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices_c), vertices_c, GL_STATIC_DRAW);

    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(1);

    glBindBuffer(GL_ARRAY_BUFFER, VBO_3);
    glBufferData(GL_ARRAY_BUFFER, sizeof(tex_uv), tex_uv, GL_STATIC_DRAW);

    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 2 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(2); */

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices2), indices2, GL_STATIC_DRAW);

    glBindBuffer(GL_ARRAY_BUFFER, VBO_2);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices_c2), vertices_c2, GL_STATIC_DRAW);

    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(1);

    glVertexAttribPointer(3, 2, GL_FLOAT, GL_FALSE, 5 * sizeof(float), (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(3);

    // load and create a texture 
    // -------------------------
    unsigned int texture;
    glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture); // all upcoming GL_TEXTURE_2D operations now have effect on this texture object
    // set the texture wrapping parameters
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);	// set texture wrapping to GL_REPEAT (default wrapping method)
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    // set texture filtering parameters
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    // load image, create texture and generate mipmaps
    int width, height, nrChannels;
    // The FileSystem::getPath(...) is part of the GitHub repository so we can find files on any IDE/platform; replace it with your own image path.
    stbi_set_flip_vertically_on_load(true);
    unsigned char *data = stbi_load((std::filesystem::current_path().string() + "/resource/image_" + std::to_string(image_idx) + ".png").c_str(), &width, &height, &nrChannels, 0);
    if (data)
    {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
        glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
        glGenerateMipmap(GL_TEXTURE_2D);
    }
    else
    {
        std::cout << "Failed to load texture" << std::endl;
    }
    stbi_image_free(data);

    float r[3] = {0.0f, 0.0f, 0.0f};
    float tim = 0.0f;
    
    while(!glfwWindowShouldClose(window)){
        processInput(window);

        glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        ourShader.use();
        ourShader.setFloat3("rot", r[0], r[1], r[2]);
        ourShader.setFloat("tim", tim);
        r[idxx] += 0.01f;
        tim += 0.01f;
        glBindTexture(GL_TEXTURE_2D, texture);
        
        glEnable(GL_CULL_FACE);
        glCullFace(GL_BACK);

        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        glEnable(GL_BLEND);
        // glDrawArrays(GL_TRIANGLES, 0, 3);
        glBindVertexArray(VAO);
        glPolygonMode(GL_FRONT_AND_BACK, GL_TRIANGLES);
        glDrawElements(GL_TRIANGLES, N, GL_UNSIGNED_INT, 0);
        glBindVertexArray(0);

        glfwSwapBuffers(window);
        glfwPollEvents();
    }


}

string loadFile(const string& fname){
    // ifstream file(fname.c_str(), ios::binary);
    string pathh = filesystem::current_path().string() + "/" + filesystem::path(fname).string();
    ifstream file(pathh.c_str(), ios::binary);
    if (!file || !file.is_open()) {
        cerr << "File not found: " << pathh << endl;
        return "";
    }
    file.seekg(0, ios::end);

    streampos length = file.tellg();
    file.seekg(0, ios::beg);

    vector<char> buffer(length);
    file.read(&buffer[0], length);
    file.close();

    return string(buffer.begin(), buffer.end());
}

void processInput(GLFWwindow *window){
    if(glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS){
        // glfwSetWindowShouldClose(window, true);
        if(!ch){
            idxx = (idxx + 1) % 3;
            ch = 1;
        }
    }else{
        ch = 0;
    }
}

void framebuffer_size_callback(GLFWwindow* window, int width, int height){
    glViewport(0, 0, width, height);
}