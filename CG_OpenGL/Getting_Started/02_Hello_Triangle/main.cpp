#include<glad/glad.h>
#include<GLFW/glfw3.h>
#include<bits/stdc++.h>
#include<filesystem>
using namespace std;

string loadFile(const string& fname);
void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void processInput(GLFWwindow *window);
int idxx = 0, ch = 0;

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
        0, sq, 1,
        0, sq, -1,
        0, -sq, 1,
        0, -sq, -1,
        sq, 1, 0,
        sq, -1, 0,
        -sq, 1, 0,
        -sq, -1, 0,
        0, sq, 1,
        0, sq, -1,
        0, -sq, 1,
        0, -sq, -1,
    };
    unsigned int N = 60;
    unsigned int indices[] = {
        0, 2, 8, 
        0, 2, 10,
        0, 8, 4,
        0, 10, 6,
        0, 4, 6,
        2, 8, 5,
        2, 10, 7,
        5, 7, 2,
        4, 6, 1,
        8, 9, 4,
        8, 9, 5, 
        10, 11, 6,
        10, 11, 7,
        4, 9, 1, 
        5, 9, 3,
        6, 11, 1,
        7, 11, 3,
        1, 3, 9, 
        1, 3, 11, 
        5, 7, 3,

        // 4, 6, 2
    };

    GLuint vertexShader, fragmentShader, shaderProgram;

    vertexShader = glCreateShader(GL_VERTEX_SHADER);
    string vertexShaderSource = loadFile("./shader/vertice.vert");
    const char* vertexShaderSourceCStr = vertexShaderSource.c_str();
    glShaderSource(vertexShader, 1, &vertexShaderSourceCStr, NULL);
    glCompileShader(vertexShader);

    fragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
    string fragmentShaderSource = loadFile("./shader/fragment.frag");
    const char* fragmentShaderSourceCStr = fragmentShaderSource.c_str();
    glShaderSource(fragmentShader, 1, &fragmentShaderSourceCStr, NULL);
    glCompileShader(fragmentShader);

    shaderProgram = glCreateProgram();
    glAttachShader(shaderProgram, vertexShader);
    glAttachShader(shaderProgram, fragmentShader);
    glLinkProgram(shaderProgram);
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);

    GLuint VAO, VBO, EBO;

    glGenBuffers(1, &EBO);

    glGenVertexArrays(1, &VAO); 
    glGenBuffers(1, &VBO);

    glBindVertexArray(VAO);

    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void*)0);

    glEnableVertexAttribArray(0);

    GLuint rotLoc = glGetUniformLocation(shaderProgram, "rot");
    float r[3] = {0.0f, 0.0f, 0.0f};
    
    while(!glfwWindowShouldClose(window)){
        processInput(window);

        glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        glUseProgram(shaderProgram);
        glUniform3f(rotLoc, r[0], r[1], r[2]);
        r[idxx] += 0.01f;
        

        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        glEnable(GL_BLEND);
        // glDrawArrays(GL_TRIANGLES, 0, 3);
        glBindVertexArray(VAO);
        glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
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