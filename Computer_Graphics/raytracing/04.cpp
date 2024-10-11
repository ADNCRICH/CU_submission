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

struct Material {
    float refractive_index = 1;
    float albedo[4] = { 2,0,0,0 };
    vec3 diffuse_color = { 0,0,0 };
    float specular_exponent = 0;
};

struct Sphere {
    vec3 center;
    float radius;
    Material material;
};

const Material      ivory = { 1.0, {0.9,  0.5, 0.1, 0.0}, {0.4, 0.4, 0.3},   50. };
const Material      glass = { 1.5, {0.0,  0.9, 0.1, 0.8}, {0.6, 0.7, 0.8},  125. };
const Material red_rubber = { 1.0, {1.4,  0.3, 0.0, 0.0}, {0.3, 0.1, 0.1},   10. };
const Material     mirror = { 1.0, {0.0, 16.0, 0.8, 0.0}, {1.0, 1.0, 1.0}, 1425. };

const Sphere spheres[] = {
    {{-3,    0,   -16}, 2,      ivory},
    {{-1.0, -1.5, -12}, 2,      glass},
    {{ 1.5, -0.5, -18}, 3, red_rubber},
    {{ 7,    5,   -18}, 4,     mirror}
};

const vec3 lights[] = {
    {-20, 20,  20},
    { 30, 50, -25},
    { 30, 20,  30}
};

vec3 reflect(const vec3& I, const vec3& N) {
    return I - N * 2.f * (I * N);
}

std::tuple<bool, float> ray_sphere_intersect(const vec3& orig, const vec3& dir, const Sphere& s) { // ret value is a pair [intersection found, distance]
    vec3 L = s.center - orig;
    float tca = L * dir;
    float d2 = L * L - tca * tca;
    if (d2 > s.radius * s.radius) return { false, 0 };
    float thc = std::sqrt(s.radius * s.radius - d2);
    float t0 = tca - thc, t1 = tca + thc;
    if (t0 > .001) return { true, t0 };  // offset the original point by .001 to avoid occlusion by the object itself
    if (t1 > .001) return { true, t1 };
    return { false, 0 };
}

std::tuple<bool, vec3, vec3, Material> scene_intersect(const vec3& orig, const vec3& dir) {
    float d;
    vec3 pt, N;
    Material material;

    float nearest_dist = 1e10;

    for (const Sphere& s : spheres) { // intersect the ray with all spheres
        auto [intersection, d] = ray_sphere_intersect(orig, dir, s);
        if (!intersection || d > nearest_dist) continue;
        nearest_dist = d;
        pt = orig + dir * nearest_dist;
        N = (pt - s.center).normalized();
        material = s.material;
    }
    return { nearest_dist < 1000, pt, N, material };
}

vec3 cast_ray(const vec3& orig, const vec3& dir) {
    auto [intersection, point, N, material] = scene_intersect(orig, dir);
    if (!intersection) {
        return vec3{ 0.2, 0.7, 0.8 }; // background color
    }

    float diffuse_light_intensity = 0, specular_light_intensity = 0;
    for (const vec3& light : lights) { // checking if the point lies in the shadow of the light
        vec3 light_dir = (light - point).normalized();
        //auto [hit, shadow_pt, trashnrm, trashmat] = scene_intersect(point, light_dir);
        //if (hit && (shadow_pt - point).norm() < (light - point).norm()) continue;
        diffuse_light_intensity += std::max(0.f, light_dir * N);
        specular_light_intensity += std::pow(std::max(0.f, -reflect(-light_dir, N) * dir), material.specular_exponent);
    }
    return material.diffuse_color * diffuse_light_intensity * material.albedo[0] + vec3{ 1., 1., 1. }*specular_light_intensity * material.albedo[1];

}


void render() {
    const int width = 1024;
    const int height = 768;
    const float fov = 1.05; // 60 degrees field of view in radians
    std::vector<vec3> framebuffer(width * height);

    for (size_t j = 0; j < height; j++) {
        for (size_t i = 0; i < width; i++) {
            float x = (2 * (i + 0.5) / (float)width - 1) * tan(fov / 2.) * width / (float)height;
            float y = -(2 * (j + 0.5) / (float)height - 1) * tan(fov / 2.);
            vec3 dir = vec3{ x, y, -1 }.normalized();
            framebuffer[i + j * width] = cast_ray(vec3{ 0, 0, 0 }, dir);
        }
    }

    std::ofstream ofs; // save the framebuffer to file
    ofs.open("./out.ppm");
    ofs << "P3\n" << width << " " << height << "\n255\n";
    for (size_t i = 0; i < height * width; ++i) {
        for (size_t j = 0; j < 3; j++) {
            ofs << std::min(255, (int)(255 * framebuffer[i][j])) << " ";
        }
        ofs << "\n";
    }
    ofs.close();
}

int main() {
    render();
    return 0;
}