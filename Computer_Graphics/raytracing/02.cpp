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

struct Sphere {
    vec3 center;
    float radius;
};

struct Polygon {
    std::vector<vec3> vertices;
    vec3 normal;
    float d;
};

const Sphere aSphere = { { 11.5, -0.5, -18}, 3 };
Polygon aPolygon = {{{1, -2, -20}, {20, -1, 20}, {-20, -1, 20}}};

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

void init_polygon(Polygon& p) {
    vec3 v1 = p.vertices[1] - p.vertices[0];
    vec3 v2 = p.vertices[2] - p.vertices[0];
    p.normal = cross(v1, v2).normalized();
    p.d = p.normal * p.vertices[0];
    printf("normal: %f %f %f %f\n", p.normal.x, p.normal.y, p.normal.z, p.d);
}

std::tuple<bool, float> ray_polygon_intersect(const vec3& orig, const vec3& dir, const Polygon& p) {
    if(p.normal * dir < 0) return { false, 0 };
    float dist = p.normal * orig + p.d;
    dist /= p.normal * dir;
    vec3 point = orig + dir * dist;
    vec3 v1 = p.vertices[1] - p.vertices[0];
    vec3 v2 = p.vertices[2] - p.vertices[0];
    vec3 v3 = p.vertices[2] - p.vertices[1];
    vec3 n1 = cross(v1, point - p.vertices[0]);
    vec3 n2 = cross(point - p.vertices[0], v2);
    vec3 n3 = cross(-v2, point - p.vertices[2]);
    vec3 n4 = cross(point - p.vertices[2], -v3);
    if (n1 * n2 > 0 && n3 * n4 > 0) return { true, dist };
    return { false, 0 };
}

vec3 cast_ray(const vec3& orig, const vec3& dir, const Sphere& sphere, const Polygon& polygon) {
    auto [intersection, d] = ray_sphere_intersect(orig, dir, sphere);
    auto [intersection2, d2] = ray_polygon_intersect(orig, dir, polygon);
    if (!intersection) {
        if (intersection2) return vec3{ 0.8, 0.7, 0.8 }; 
        return vec3{ 0.2, 0.7, 0.8 }; // background color
    }
    return vec3{ 0.4, 0.4, 0.3 };
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
            framebuffer[i + j * width] = cast_ray(vec3{ 0, 0, 0 }, dir, aSphere, aPolygon);
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
    init_polygon(aPolygon);
    render();
    return 0;
}