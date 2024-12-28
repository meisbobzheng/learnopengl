#include <glad/glad.h>
#include <SDL.h>
#include <iostream>

int gScreenWidth = 800;
int gScreenHeight = 600;
SDL_Window* gGraphicsApplicationWindow = nullptr;
SDL_GLContext gOpenGLContext = nullptr;
GLuint gGraphicsPipelineShaderProgram = 0;

bool running = true;

// VAO 1
GLuint gVertexArrayObject = 0;

// VBO 1
GLuint gVertexBufferObject = 0;

// EBO
GLuint gElementBufferObject = 0;

// Shader source code
const char *vertexShaderSource = "#version 330 core\n"
    "in vec4 position;\n"
    "void main()\n"
    "{\n"
    "   gl_Position = vec4(position.x, position.y, position.z, position.w);\n"
    "}\0";

const char *fragmentShaderSource = "#version 330 core\n"
    "out vec4 color;\n"
    "void main()\n"
    "{\n"
    "    color = vec4(0.5f, 0.5f, 0.0f, 1.0f);\n"
    "}\0";

const char *fragmentShaderSource2 = "#version 330 core\n"
    "out vec4 color;\n"
    "void main()\n"
    "{\n"
    "    color = vec4(1.0f, 1.0f, 0.0f, 1.0f);\n"
    "}\0";

void DisplayInfo() {
    std::cout << "Vendor: " << glGetString(GL_VENDOR) << std::endl;
    std::cout << "Renderer: " << glGetString(GL_RENDERER) << std::endl;
    std::cout << "Version: " << glGetString(GL_VERSION) << std::endl;
    std::cout << "Shading Language: " << glGetString(GL_SHADING_LANGUAGE_VERSION) << std::endl;
}

void InitializeProgram() {
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        std::cout << "Failed to initialize SDL: " << SDL_GetError() << std::endl;
        exit(-1);
    }

    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);

    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);

    gGraphicsApplicationWindow = SDL_CreateWindow(
        "LearnOpenGL", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        gScreenWidth, gScreenHeight, SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE
    );

    if (!gGraphicsApplicationWindow) {
        std::cout << "Failed to create SDL window: " << SDL_GetError() << std::endl;
        exit(-1);
    }

    gOpenGLContext = SDL_GL_CreateContext(gGraphicsApplicationWindow);
    if (!gOpenGLContext) {
        std::cout << "Failed to create OpenGL context: " << SDL_GetError() << std::endl;
        exit(-1);
    }

    if (!gladLoadGLLoader((GLADloadproc)SDL_GL_GetProcAddress)) {
        std::cout << "Failed to initialize GLAD" << std::endl;
        exit (-1);
    }

    glViewport(0, 0, gScreenWidth, gScreenHeight);
    DisplayInfo();
}

void ProcessInput(bool& running) {
    SDL_Event event;

    while (SDL_PollEvent(&event) != 0) {
        if (event.type == SDL_QUIT ||(event.type == SDL_KEYDOWN && event.key.keysym.sym == SDLK_ESCAPE)){
            running = false;
        }
    }
}

void VertexSpecification() {
    // Define vertex data and buffers
    const std::vector<GLfloat> vertices {
        0.5f,  0.5f, 0.0f,
        0.5f, -0.5f, 0.0f,
        -0.5f, -0.5f, 0.0f,
        -0.5f,  0.5f, 0.0f
    };

    const std::vector<GLuint> indices {
        0, 1, 3,
        1, 2, 3
    };

    glGenVertexArrays(1, &gVertexArrayObject);
    glBindVertexArray(gVertexArrayObject);

    glGenBuffers(1, &gVertexBufferObject);
    glBindBuffer(GL_ARRAY_BUFFER, gVertexBufferObject);
    glBufferData(GL_ARRAY_BUFFER,  vertices.size() * sizeof(GLfloat), vertices.data(), GL_STATIC_DRAW);

    glGenBuffers(1, &gElementBufferObject);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, gElementBufferObject);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size() * sizeof(GLuint), indices.data(), GL_STATIC_DRAW);


    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void*)0);
    glBindVertexArray(0);

    glDisableVertexAttribArray(0);
}

GLuint CompileShader(GLuint type, const std::string& source) {
    GLuint shaderObject = glCreateShader(type);

    const char* src = source.c_str();
    glShaderSource(shaderObject, 1, &src, nullptr);
    glCompileShader(shaderObject);

    int result;
    glGetShaderiv(shaderObject, GL_COMPILE_STATUS, &result);

    if (result == GL_FALSE) {
        int length;
        glGetShaderiv(shaderObject, GL_INFO_LOG_LENGTH, &length);
        char* errorMessages = new char[length];
        glGetShaderInfoLog(shaderObject, length, &length, errorMessages);

        if (type == GL_VERTEX_SHADER) {
            std::cout << "Error compiling vertex shader" << errorMessages << std::endl;
        } else if ( type == GL_FRAGMENT_SHADER) {
            std::cout << "Error compiling fragment shader" << errorMessages << std::endl;
        }
        delete[] errorMessages;
        glDeleteShader(shaderObject);
        return 0;
    }

    return shaderObject;
}

GLuint CreateShaderProgram(const std::string& vs, const std::string& fs) {
    const GLuint programObject = glCreateProgram();

    const GLuint vertexShader = CompileShader(GL_VERTEX_SHADER, vs);
    const GLuint fragmentShader = CompileShader(GL_FRAGMENT_SHADER, fs);

    glAttachShader(programObject, vertexShader);
    glAttachShader(programObject, fragmentShader);
    glLinkProgram(programObject);

    glValidateProgram(programObject);

    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);

    return programObject;
}

void CreateGraphicsPipeline() {
    gGraphicsPipelineShaderProgram = CreateShaderProgram(vertexShaderSource, fragmentShaderSource);
}

void PreDraw() {
    glDisable(GL_DEPTH_TEST);
    glDisable(GL_CULL_FACE);

    glViewport(0, 0, gScreenWidth, gScreenHeight);
    glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
    glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);

    glUseProgram(gGraphicsPipelineShaderProgram);
}

void Draw() {
    glBindVertexArray(gVertexArrayObject);

    // glBindBuffer(GL_ARRAY_BUFFER, gVertexBufferObject);
    // glDrawArrays(GL_TRIANGLES, 0, 3);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, gElementBufferObject);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);

    glUseProgram(0);
}

void Cleanup() {
    SDL_GL_DeleteContext(gOpenGLContext);
    SDL_DestroyWindow(gGraphicsApplicationWindow);
    SDL_Quit();
    glDeleteBuffers(1, &gVertexBufferObject);
    glDeleteVertexArrays(1, &gVertexArrayObject);

    glDeleteProgram(gGraphicsPipelineShaderProgram);
}

void MainLoop() {
    // Main loop
    while (running) {
        ProcessInput(running);
        PreDraw();
        Draw();
        SDL_GL_SwapWindow(gGraphicsApplicationWindow);
    }
}


int main() {
    InitializeProgram();
    VertexSpecification();
    CreateGraphicsPipeline();
    MainLoop();
    Cleanup();
    return 0;
}
