#include <glad/glad.h>
#include <GLFW/glfw3.h>
#define STB_IMAGE_IMPLEMENTATION
#include "/usr/local/include/libstb/stb_image.h"

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include "../../Library/shader_m.h"
#include "../../Library/camera.h"

#include <iostream>

void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void mouse_callback(GLFWwindow* window, double xpos, double ypos);
void scroll_callback(GLFWwindow* window, double xoffset, double yoffset);
void processInput(GLFWwindow *window);
unsigned int loadTexture(const char *path);

// settings
const unsigned int SCR_WIDTH = 1920;
const unsigned int SCR_HEIGHT = 1080;

// camera
Camera camera(glm::vec3(0.0f, 0.0f, 3.0f));
float lastX = SCR_WIDTH / 2.0f;
float lastY = SCR_HEIGHT / 2.0f;
bool firstMouse = true;

// timing
float deltaTime = 0.0f;
float lastFrame = 0.0f;

// lighting
glm::vec3 lightPos(1.2f, 1.0f, 2.0f);

float ch_R = 1.0f, ch_G = 0.5f, ch_B = 0.0f, ch_Y = 0.5f;
int toggle = 1;
int sgn_R = -1, sgn_G = -1, sgn_B = 1, sgn_Y = 1;

int main()
{
    // glfw: initialize and configure
    // ------------------------------
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

#ifdef __APPLE__
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
#endif

    // glfw window creation
    // --------------------
    GLFWwindow* window = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "Multi Lights", NULL, NULL);
    if (window == NULL)
    {
        std::cout << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
    glfwSetCursorPosCallback(window, mouse_callback);
    glfwSetScrollCallback(window, scroll_callback);

    // tell GLFW to capture our mouse
    glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);

    // glad: load all OpenGL function pointers
    // ---------------------------------------
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
        std::cout << "Failed to initialize GLAD" << std::endl;
        return -1;
    }

    // configure global opengl state
    // -----------------------------
    glEnable(GL_DEPTH_TEST);

    // build and compile our shader zprogram
    // ------------------------------------
    Shader lightingShader("./shader/light.vert", "./shader/light.frag");
    Shader lightCubeShader("./shader/light_cube.vert", "./shader/light_cube.frag");

    // set up vertex data (and buffer(s)) and configure vertex attributes
    // ------------------------------------------------------------------
    float vertices[] = {
        // positions          // normals           // texture coords
        -0.5f, -0.5f, -0.5f,  0.0f,  0.0f, -1.0f,  0.0f,  0.0f,
         0.5f, -0.5f, -0.5f,  0.0f,  0.0f, -1.0f,  1.0f,  0.0f,
         0.5f,  0.5f, -0.5f,  0.0f,  0.0f, -1.0f,  1.0f,  1.0f,
         0.5f,  0.5f, -0.5f,  0.0f,  0.0f, -1.0f,  1.0f,  1.0f,
        -0.5f,  0.5f, -0.5f,  0.0f,  0.0f, -1.0f,  0.0f,  1.0f,
        -0.5f, -0.5f, -0.5f,  0.0f,  0.0f, -1.0f,  0.0f,  0.0f,

        -0.5f, -0.5f,  0.5f,  0.0f,  0.0f,  1.0f,  0.0f,  0.0f,
         0.5f, -0.5f,  0.5f,  0.0f,  0.0f,  1.0f,  1.0f,  0.0f,
         0.5f,  0.5f,  0.5f,  0.0f,  0.0f,  1.0f,  1.0f,  1.0f,
         0.5f,  0.5f,  0.5f,  0.0f,  0.0f,  1.0f,  1.0f,  1.0f,
        -0.5f,  0.5f,  0.5f,  0.0f,  0.0f,  1.0f,  0.0f,  1.0f,
        -0.5f, -0.5f,  0.5f,  0.0f,  0.0f,  1.0f,  0.0f,  0.0f,

        -0.5f,  0.5f,  0.5f, -1.0f,  0.0f,  0.0f,  1.0f,  0.0f,
        -0.5f,  0.5f, -0.5f, -1.0f,  0.0f,  0.0f,  1.0f,  1.0f,
        -0.5f, -0.5f, -0.5f, -1.0f,  0.0f,  0.0f,  0.0f,  1.0f,
        -0.5f, -0.5f, -0.5f, -1.0f,  0.0f,  0.0f,  0.0f,  1.0f,
        -0.5f, -0.5f,  0.5f, -1.0f,  0.0f,  0.0f,  0.0f,  0.0f,
        -0.5f,  0.5f,  0.5f, -1.0f,  0.0f,  0.0f,  1.0f,  0.0f,

         0.5f,  0.5f,  0.5f,  1.0f,  0.0f,  0.0f,  1.0f,  0.0f,
         0.5f,  0.5f, -0.5f,  1.0f,  0.0f,  0.0f,  1.0f,  1.0f,
         0.5f, -0.5f, -0.5f,  1.0f,  0.0f,  0.0f,  0.0f,  1.0f,
         0.5f, -0.5f, -0.5f,  1.0f,  0.0f,  0.0f,  0.0f,  1.0f,
         0.5f, -0.5f,  0.5f,  1.0f,  0.0f,  0.0f,  0.0f,  0.0f,
         0.5f,  0.5f,  0.5f,  1.0f,  0.0f,  0.0f,  1.0f,  0.0f,

        -0.5f, -0.5f, -0.5f,  0.0f, -1.0f,  0.0f,  0.0f,  1.0f,
         0.5f, -0.5f, -0.5f,  0.0f, -1.0f,  0.0f,  1.0f,  1.0f,
         0.5f, -0.5f,  0.5f,  0.0f, -1.0f,  0.0f,  1.0f,  0.0f,
         0.5f, -0.5f,  0.5f,  0.0f, -1.0f,  0.0f,  1.0f,  0.0f,
        -0.5f, -0.5f,  0.5f,  0.0f, -1.0f,  0.0f,  0.0f,  0.0f,
        -0.5f, -0.5f, -0.5f,  0.0f, -1.0f,  0.0f,  0.0f,  1.0f,

        -0.5f,  0.5f, -0.5f,  0.0f,  1.0f,  0.0f,  0.0f,  1.0f,
         0.5f,  0.5f, -0.5f,  0.0f,  1.0f,  0.0f,  1.0f,  1.0f,
         0.5f,  0.5f,  0.5f,  0.0f,  1.0f,  0.0f,  1.0f,  0.0f,
         0.5f,  0.5f,  0.5f,  0.0f,  1.0f,  0.0f,  1.0f,  0.0f,
        -0.5f,  0.5f,  0.5f,  0.0f,  1.0f,  0.0f,  0.0f,  0.0f,
        -0.5f,  0.5f, -0.5f,  0.0f,  1.0f,  0.0f,  0.0f,  1.0f
    };
    float gr = (1 + sqrt(5)) / 2;
    float ll = 0.5 - 0.5 / sqrt(3);
    float rr = 0.5 + 0.5 / sqrt(3);
    float vertices2[] = {
        0, 1, gr, 0.3568, 0.0, 0.9342, rr, 0.5, 
        0, -1, gr, 0.3568, 0.0, 0.9342, ll, 0.5, 
        gr, 0, 1, 0.3568, 0.0, 0.9342, 0.5, 0, 

        0, 1, gr, -0.3568, 0.0, 0.9342, rr, 0.5, 
        -gr, 0, 1, -0.3568, 0.0, 0.9342, 0.5, 1, 
        0, -1, gr, -0.3568, 0.0, 0.9342, ll, 0.5, 

        0, 1, gr, 0.5774, 0.5774, 0.5774, 0.5, 1, 
        gr, 0, 1, 0.5774, 0.5774, 0.5774, ll, 0.5, 
        1, gr, 0, 0.5774, 0.5774, 0.5774, rr, 0.5, 

        0, 1, gr, -0.5774, 0.5774, 0.5774, ll, 0.5, 
        -1, gr, 0, -0.5774, 0.5774, 0.5774, rr, 0.5, 
        -gr, 0, 1, -0.5774, 0.5774, 0.5774, 0.5, 0, 

        0, 1, gr, 0.0, 0.9342, 0.3568, ll, 0.5, 
        1, gr, 0, 0.0, 0.9342, 0.3568, 0.5, 1, 
        -1, gr, 0, 0.0, 0.9342, 0.3568, rr, 0.5, 

        0, -1, gr, 0.5774, -0.5774, 0.5774, 0.5, 0, 
        1, -gr, 0, 0.5774, -0.5774, 0.5774, rr, 0.5, 
        gr, 0, 1, 0.5774, -0.5774, 0.5774, ll, 0.5, 

        0, -1, gr, -0.5774, -0.5774, 0.5774, 0.5, 1, 
        -gr, 0, 1, -0.5774, -0.5774, 0.5774, rr, 0.5, 
        -1, -gr, 0, -0.5774, -0.5774, 0.5774, ll, 0.5, 

        1, -gr, 0, 0.0, -0.9342, 0.3568, ll, 0.5, 
        0, -1, gr, 0.0, -0.9342, 0.3568, 0.5, 0, 
        -1, -gr, 0, 0.0, -0.9342, 0.3568, rr, 0.5, 

        1, gr, 0, 0.0, 0.9342, -0.3568, ll, 0.5, 
        0, 1, -gr, 0.0, 0.9342, -0.3568, rr, 0.5, 
        -1, gr, 0, 0.0, 0.9342, -0.3568, 0.5, 0, 

        gr, 0, 1, 0.9342, 0.3568, 0.0, ll, 0.5, 
        gr, 0, -1, 0.9342, 0.3568, 0.0, 0.5, 0, 
        1, gr, 0, 0.9342, 0.3568, 0.0, rr, 0.5, 

        gr, 0, 1, 0.9342, -0.3568, 0.0, ll, 0.5, 
        1, -gr, 0, 0.9342, -0.3568, 0.0, rr, 0.5, 
        gr, 0, -1, 0.9342, -0.3568, 0.0, 0.5, 1, 

        -gr, 0, 1, -0.9342, 0.3568, 0.0, 0.5, 1, 
        -1, gr, 0, -0.9342, 0.3568, 0.0, ll, 0.5, 
        -gr, 0, -1, -0.9342, 0.3568, 0.0, rr, 0.5, 

        -gr, 0, 1, -0.9342, -0.3568, -0.0, rr, 0.5, 
        -gr, 0, -1, -0.9342, -0.3568, -0.0, 0.5, 0, 
        -1, -gr, 0, -0.9342, -0.3568, -0.0, ll, 0.5, 

        1, gr, 0, 0.5774, 0.5774, -0.5774, ll, 0.5, 
        gr, 0, -1, 0.5774, 0.5774, -0.5774, 0.5, 1, 
        0, 1, -gr, 0.5774, 0.5774, -0.5774, rr, 0.5, 

        1, -gr, 0, 0.5774, -0.5774, -0.5774, 0.5, 1, 
        0, -1, -gr, 0.5774, -0.5774, -0.5774, ll, 0.5, 
        gr, 0, -1, 0.5774, -0.5774, -0.5774, rr, 0.5, 

        -1, gr, 0, -0.5774, 0.5774, -0.5774, ll, 0.5, 
        0, 1, -gr, -0.5774, 0.5774, -0.5774, 0.5, 0, 
        -gr, 0, -1, -0.5774, 0.5774, -0.5774, rr, 0.5, 

        -1, -gr, 0, -0.5774, -0.5774, -0.5774, 0.5, 0, 
        -gr, 0, -1, -0.5774, -0.5774, -0.5774, rr, 0.5, 
        0, -1, -gr, -0.5774, -0.5774, -0.5774, ll, 0.5, 

        0, 1, -gr, 0.3568, 0.0, -0.9342, 0.5, 0, 
        gr, 0, -1, 0.3568, 0.0, -0.9342, rr, 0.5, 
        0, -1, -gr, 0.3568, 0.0, -0.9342, ll, 0.5, 

        0, 1, -gr, -0.3568, -0.0, -0.9342, 0.5, 1, 
        0, -1, -gr, -0.3568, -0.0, -0.9342, ll, 0.5, 
        -gr, 0, -1, -0.3568, -0.0, -0.9342, rr, 0.5, 

        1, -gr, 0, -0.0, -0.9342, -0.3568, ll, 0.5, 
        -1, -gr, 0, -0.0, -0.9342, -0.3568, rr, 0.5, 
        0, -1, -gr, -0.0, -0.9342, -0.3568, 0.5, 1,
    };

    float sacle = 0.3;
    for (int i = 0; i < 60; i++) {
        vertices2[i * 8] *= sacle;
        vertices2[i * 8 + 1] *= sacle;
        vertices2[i * 8 + 2] *= sacle;
    }



    // positions all containers
    glm::vec3 cubePositions[] = {
        glm::vec3( 0.0f,  0.0f,  0.0f),
        glm::vec3( 2.0f,  5.0f, -15.0f),
        glm::vec3(-1.5f, -2.2f, -2.5f),
        glm::vec3(-3.8f, -2.0f, -12.3f),
        glm::vec3( 2.4f, -0.4f, -3.5f),
        glm::vec3(-1.7f,  3.0f, -7.5f),
        glm::vec3( 1.3f, -2.0f, -2.5f),
        glm::vec3( 1.5f,  2.0f, -2.5f),
        glm::vec3( 1.5f,  0.2f, -1.5f),
        glm::vec3(-1.3f,  1.0f, -1.5f)
    };
    // positions of the point lights
    glm::vec3 pointLightPositions[] = {
        glm::vec3( 0.7f,  0.2f,  2.0f),
        glm::vec3( 2.3f, -3.3f, -4.0f),
        glm::vec3( -3.0f,  0.0f,  0.0f),
        glm::vec3( 0.0f,  0.0f, -3.0f)
    };
    // first, configure the cube's VAO (and VBO)
    unsigned int VBO, cubeVAO;
    glGenVertexArrays(1, &cubeVAO);
    glGenBuffers(1, &VBO);

    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices2), vertices2, GL_STATIC_DRAW);

    glBindVertexArray(cubeVAO);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(6 * sizeof(float)));
    glEnableVertexAttribArray(2);

    // second, configure the light's VAO (VBO stays the same; the vertices are the same for the light object which is also a 3D cube)
    unsigned int lightCubeVAO;
    glGenVertexArrays(1, &lightCubeVAO);
    glBindVertexArray(lightCubeVAO);

    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    // note that we update the lamp's position attribute's stride to reflect the updated buffer data
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);

    // load textures (we now use a utility function to keep the code more organized)
    // -----------------------------------------------------------------------------
    // unsigned int diffuseMap = loadTexture("./resource/container2.png");
    unsigned int diffuseMap = loadTexture("./resource/image_1.png");
    unsigned int specularMap = loadTexture("./resource/white.png");

    // shader configuration
    // --------------------
    lightingShader.use();
    lightingShader.setInt("material.diffuse", 0);
    lightingShader.setInt("material.specular", 1);


    // render loop
    // -----------
    while (!glfwWindowShouldClose(window))
    {
        // per-frame time logic
        // --------------------
        float currentFrame = static_cast<float>(glfwGetTime());
        deltaTime = currentFrame - lastFrame;
        lastFrame = currentFrame;

        // input
        // -----
        processInput(window);

        // render
        // ------
        glClearColor(0.1f, 0.1f, 0.1f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        // be sure to activate shader when setting uniforms/drawing objects
        lightingShader.use();
        lightingShader.setVec3("viewPos", camera.Position);
        lightingShader.setFloat("material.shininess", 32.0f);

        /*
           Here we set all the uniforms for the 5/6 types of lights we have. We have to set them manually and index 
           the proper PointLight struct in the array to set each uniform variable. This can be done more code-friendly
           by defining light types as classes and set their values in there, or by using a more efficient uniform approach
           by using 'Uniform buffer objects', but that is something we'll discuss in the 'Advanced GLSL' tutorial.
        */
        // directional light
        lightingShader.setVec3("dirLight.direction", -0.2f, -1.0f, -0.3f);
        lightingShader.setVec3("dirLight.ambient", 0.05f, 0.05f, 0.05f);
        lightingShader.setVec3("dirLight.diffuse", 0.4f, 0.4f, 0.4f);
        // lightingShader.setVec3("dirLight.specular", 0.5f, 0.5f, 0.5f);
        // lightingShader.setVec3("dirLight.ambient", 0.f, 0.f, 0.f);
        // lightingShader.setVec3("dirLight.diffuse", 0.f, 0.f, 0.f);
        lightingShader.setVec3("dirLight.specular", 0.f, 0.f, 0.f);

        // point light 1
        lightingShader.setVec3("pointLights[0].position", pointLightPositions[0]); // R
        lightingShader.setVec3("pointLights[0].ambient", 0.05f*ch_R, 0.0f, 0.0f);
        lightingShader.setVec3("pointLights[0].diffuse", 0.8f*ch_R, 0.0f, 0.0f);
        lightingShader.setVec3("pointLights[0].specular", 1.0f*ch_R, 0.0f, 0.0f);
        lightingShader.setFloat("pointLights[0].constant", 1.0f);
        lightingShader.setFloat("pointLights[0].linear", 0.09f);
        lightingShader.setFloat("pointLights[0].quadratic", 0.032f);
        // point light 2
        lightingShader.setVec3("pointLights[1].position", pointLightPositions[1]); // G
        lightingShader.setVec3("pointLights[1].ambient", 0.0f, 0.05f*ch_G, 0.0f);
        lightingShader.setVec3("pointLights[1].diffuse", 0.0f, 0.8f*ch_G, 0.0f);
        lightingShader.setVec3("pointLights[1].specular", 0.0f, 1.0f*ch_G, 0.0f);
        lightingShader.setFloat("pointLights[1].constant", 1.0f);
        lightingShader.setFloat("pointLights[1].linear", 0.09f);
        lightingShader.setFloat("pointLights[1].quadratic", 0.032f);
        // point light 3
        lightingShader.setVec3("pointLights[2].position", pointLightPositions[2]); // Y
        lightingShader.setVec3("pointLights[2].ambient", 0.05f*ch_Y, 0.05f*ch_Y, 0.0f);
        lightingShader.setVec3("pointLights[2].diffuse", 0.8f*ch_Y, 0.8f*ch_Y, 0.0f);
        lightingShader.setVec3("pointLights[2].specular", 1.0f*ch_Y, 1.0f*ch_Y, 0.0f);
        lightingShader.setFloat("pointLights[2].constant", 1.0f);
        lightingShader.setFloat("pointLights[2].linear", 0.09f);
        lightingShader.setFloat("pointLights[2].quadratic", 0.032f);
        // point light 4
        lightingShader.setVec3("pointLights[3].position", pointLightPositions[3]); // B
        lightingShader.setVec3("pointLights[3].ambient", 0.0f, 0.0f, 0.05f*ch_B);
        lightingShader.setVec3("pointLights[3].diffuse", 0.0f, 0.0f, 0.8f*ch_B);
        lightingShader.setVec3("pointLights[3].specular", 0.0f, 0.0f, 1.0f*ch_B);
        lightingShader.setFloat("pointLights[3].constant", 1.0f);
        lightingShader.setFloat("pointLights[3].linear", 0.09f);
        lightingShader.setFloat("pointLights[3].quadratic", 0.032f);
        // spotLight
        lightingShader.setVec3("spotLight.position", camera.Position);
        lightingShader.setVec3("spotLight.direction", camera.Front);
        lightingShader.setVec3("spotLight.ambient", 0.0f, 0.0f, 0.0f);
        lightingShader.setVec3("spotLight.diffuse", 1.0f, 1.0f, 1.0f);
        lightingShader.setVec3("spotLight.specular", 1.0f, 1.0f, 1.0f);
        lightingShader.setFloat("spotLight.constant", 1.0f);
        lightingShader.setFloat("spotLight.linear", 0.09f);
        lightingShader.setFloat("spotLight.quadratic", 0.032f);
        lightingShader.setFloat("spotLight.cutOff", glm::cos(glm::radians(0.0f)));
        lightingShader.setFloat("spotLight.outerCutOff", glm::cos(glm::radians(0.0f)));     

        // view/projection transformations
        glm::mat4 projection = glm::perspective(glm::radians(camera.Zoom), (float)SCR_WIDTH / (float)SCR_HEIGHT, 0.1f, 100.0f);
        glm::mat4 view = camera.GetViewMatrix();
        lightingShader.setMat4("projection", projection);
        lightingShader.setMat4("view", view);

        // world transformation
        glm::mat4 model = glm::mat4(1.0f);
        lightingShader.setMat4("model", model);

        // bind diffuse map
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, diffuseMap);
        // bind specular map
        glActiveTexture(GL_TEXTURE1);
        glBindTexture(GL_TEXTURE_2D, specularMap);

        // render containers
        glBindVertexArray(cubeVAO);
        for (unsigned int i = 0; i < 10; i++)
        {
            // calculate the model matrix for each object and pass it to shader before drawing
            glm::mat4 model = glm::mat4(1.0f);
            model = glm::translate(model, cubePositions[i]);
            float angle = 20.0f * i;
            model = glm::rotate(model, glm::radians(angle), glm::vec3(1.0f, 0.3f, 0.5f));
            lightingShader.setMat4("model", model);

            glDrawArrays(GL_TRIANGLES, 0, 60);
        }

         // also draw the lamp object(s)
         lightCubeShader.use();
         lightCubeShader.setMat4("projection", projection);
         lightCubeShader.setMat4("view", view);
    
         // we now draw as many light bulbs as we have point lights.

        float light_color[4][3] = {
            {1.0f*ch_R, 0.0f, 0.0f}, // R
            {0.0f, 1.0f*ch_G, 0.0f}, // G
            {1.0f*ch_Y, 1.0f*ch_Y, 0.0f}, // Y
            {0.0f, 0.0f, 1.0f*ch_B}  // B
        };

         glBindVertexArray(lightCubeVAO);
         for (unsigned int i = 0; i < 4; i++)
         {
             model = glm::mat4(1.0f);
             model = glm::translate(model, pointLightPositions[i]);
             model = glm::scale(model, glm::vec3(0.2f)); // Make it a smaller cube
             lightCubeShader.setMat4("model", model);
             lightCubeShader.setVec3("lightColor", light_color[i][0], light_color[i][1], light_color[i][2]);
             glDrawArrays(GL_TRIANGLES, 0, 60);
         }


        // glfw: swap buffers and poll IO events (keys pressed/released, mouse moved etc.)
        // -------------------------------------------------------------------------------
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    // optional: de-allocate all resources once they've outlived their purpose:
    // ------------------------------------------------------------------------
    glDeleteVertexArrays(1, &cubeVAO);
    glDeleteVertexArrays(1, &lightCubeVAO);
    glDeleteBuffers(1, &VBO);

    // glfw: terminate, clearing all previously allocated GLFW resources.
    // ------------------------------------------------------------------
    glfwTerminate();
    return 0;
}

// process all input: query GLFW whether relevant keys are pressed/released this frame and react accordingly
// ---------------------------------------------------------------------------------------------------------
void processInput(GLFWwindow *window)
{
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);

    if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
        camera.ProcessKeyboard(FORWARD, deltaTime);
    if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
        camera.ProcessKeyboard(BACKWARD, deltaTime);
    if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
        camera.ProcessKeyboard(LEFT, deltaTime);
    if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
        camera.ProcessKeyboard(RIGHT, deltaTime);

    if (glfwGetKey(window, GLFW_KEY_R) == GLFW_PRESS){
        if (glfwGetKey(window, GLFW_KEY_UP) == GLFW_PRESS){
            ch_R += 0.01f;
            if (ch_R > 1.0f)
                ch_R = 1.0f;
        } else if (glfwGetKey(window, GLFW_KEY_DOWN) == GLFW_PRESS){
            ch_R -= 0.01f;
            if (ch_R < 0.0f)
                ch_R = 0.0f;
        }
    }

    if (glfwGetKey(window, GLFW_KEY_G) == GLFW_PRESS){
        if (glfwGetKey(window, GLFW_KEY_UP) == GLFW_PRESS){
            ch_G += 0.01f;
            if (ch_G > 1.0f)
                ch_G = 1.0f;
        } else if (glfwGetKey(window, GLFW_KEY_DOWN) == GLFW_PRESS){
            ch_G -= 0.01f;
            if (ch_G < 0.0f)
                ch_G = 0.0f;
        }
    }

    if (glfwGetKey(window, GLFW_KEY_B) == GLFW_PRESS){
        if (glfwGetKey(window, GLFW_KEY_UP) == GLFW_PRESS){
            ch_B += 0.01f;
            if (ch_B > 1.0f)
                ch_B = 1.0f;
        } else if (glfwGetKey(window, GLFW_KEY_DOWN) == GLFW_PRESS){
            ch_B -= 0.01f;
            if (ch_B < 0.0f)
                ch_B = 0.0f;
        }
    }

    if (glfwGetKey(window, GLFW_KEY_Y) == GLFW_PRESS){
        if (glfwGetKey(window, GLFW_KEY_UP) == GLFW_PRESS){
            ch_Y += 0.01f;
            if (ch_Y > 1.0f)
                ch_Y = 1.0f;
        } else if (glfwGetKey(window, GLFW_KEY_DOWN) == GLFW_PRESS){
            ch_Y -= 0.01f;
            if (ch_Y < 0.0f)
                ch_Y = 0.0f;
        }
    }

    if (toggle){
        if (sgn_R == 1 && ch_R >= 1.0f){
            sgn_R = -1;
        } else if (sgn_R == -1 && ch_R <= 0.0f){
            sgn_R = 1;
        }
        if (sgn_G == 1 && ch_G >= 1.0f){
            sgn_G = -1;
        } else if (sgn_G == -1 && ch_G <= 0.0f){
            sgn_G = 1;
        }
        if (sgn_B == 1 && ch_B >= 1.0f){
            sgn_B = -1;
        } else if (sgn_B == -1 && ch_B <= 0.0f){
            sgn_B = 1;
        }
        if (sgn_Y == 1 && ch_Y >= 1.0f){
            sgn_Y = -1;
        } else if (sgn_Y == -1 && ch_Y <= 0.0f){
            sgn_Y = 1;
        }
        ch_R += 0.01f * sgn_R;
        ch_G += 0.01f * sgn_G;
        ch_B += 0.01f * sgn_B;
        ch_Y += 0.01f * sgn_Y;

    }

}

// glfw: whenever the window size changed (by OS or user resize) this callback function executes
// ---------------------------------------------------------------------------------------------
void framebuffer_size_callback(GLFWwindow* window, int width, int height)
{
    // make sure the viewport matches the new window dimensions; note that width and 
    // height will be significantly larger than specified on retina displays.
    glViewport(0, 0, width, height);
}

// glfw: whenever the mouse moves, this callback is called
// -------------------------------------------------------
void mouse_callback(GLFWwindow* window, double xposIn, double yposIn)
{
    float xpos = static_cast<float>(xposIn);
    float ypos = static_cast<float>(yposIn);

    if (firstMouse)
    {
        lastX = xpos;
        lastY = ypos;
        firstMouse = false;
    }

    float xoffset = xpos - lastX;
    float yoffset = lastY - ypos; // reversed since y-coordinates go from bottom to top

    lastX = xpos;
    lastY = ypos;

    camera.ProcessMouseMovement(xoffset, yoffset);
}

// glfw: whenever the mouse scroll wheel scrolls, this callback is called
// ----------------------------------------------------------------------
void scroll_callback(GLFWwindow* window, double xoffset, double yoffset)
{
    camera.ProcessMouseScroll(static_cast<float>(yoffset));
}

// utility function for loading a 2D texture from file
// ---------------------------------------------------
unsigned int loadTexture(char const * path)
{
    unsigned int textureID;
    glGenTextures(1, &textureID);

    int width, height, nrComponents;
    unsigned char *data = stbi_load(path, &width, &height, &nrComponents, 0);
    if (data)
    {
        GLenum format;
        if (nrComponents == 1)
            format = GL_RED;
        else if (nrComponents == 3)
            format = GL_RGB;
        else if (nrComponents == 4)
            format = GL_RGBA;

        glBindTexture(GL_TEXTURE_2D, textureID);
        glTexImage2D(GL_TEXTURE_2D, 0, format, width, height, 0, format, GL_UNSIGNED_BYTE, data);
        glGenerateMipmap(GL_TEXTURE_2D);

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

        stbi_image_free(data);
    }
    else
    {
        std::cout << "Texture failed to load at path: " << path << std::endl;
        stbi_image_free(data);
    }

    return textureID;
}

