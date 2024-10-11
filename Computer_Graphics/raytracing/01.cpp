#include <tuple>
#include <vector>
#include <fstream>
#include <algorithm>
#include <cmath>

struct vec3 {
    float x = 0, y = 0, z = 0;
    float& operator[](const int i) { return i == 0 ? x : (1 == i ? y : z); }
    const float& operator[](const int i) const { return i == 0 ? x : (1 == i ? y : z); }
    vec3  operator*(const float v) const { return { x * v, y * v, z * v }; }
    float operator*(const vec3& v) const { return x * v.x + y * v.y + z * v.z; }
    vec3  operator+(const vec3& v) const { return { x + v.x, y + v.y, z + v.z }; }
    vec3  operator-(const vec3& v) const { return { x - v.x, y - v.y, z - v.z }; }
    vec3  operator-()              const { return { -x, -y, -z }; }
    float norm() const { return std::sqrt(x * x + y * y + z * z); }
    vec3 normalized() const { return (*this) * (1.f / norm()); }
};

vec3 cross(const vec3 v1, const vec3 v2) {
    return { v1.y * v2.z - v1.z * v2.y, v1.z * v2.x - v1.x * v2.z, v1.x * v2.y - v1.y * v2.x };
}

void render() {
    const int width = 1024;
    const int height = 768;
    std::vector<vec3> framebuffer(width * height);

    for (size_t j = 0; j < height; j++) {
        for (size_t i = 0; i < width; i++) {
            framebuffer[i + j * width] = vec3{ j / float(height), i / float(width), 0 };
        }
    }

    std::ofstream ofs; // save the framebuffer to file
    ofs.open("./out.ppm");
    ofs << "P3\n" << width << " " << height << "\n255\n";
    for (size_t i = 0; i < height * width; ++i) {
        for (size_t j = 0; j < 3; j++) {
            ofs << (int)(255 * framebuffer[i][j]) << " ";
        }
        ofs << "\n";
    }
    ofs.close();
}

int main() {
    render();
    return 0;
}