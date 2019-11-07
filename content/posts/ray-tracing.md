---
title: "Deep Dive 2019 - Writing a Ray Tracer in Go"
date: 2018-05-23T16:10:36-04:00
draft: false
tags: ["Graphics", "Ray Tracing", "Go"]
categories: ["Software", "Graphics", "Deep Dive"]
---

This year, I decided to start doing an annual deep dive on a subject that I know nothing about.

My decision was inspired by a quote that I saw on twitter.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">
At any time of your life,<br><br>you should be learning something new that makes you feel like an 
idiot.
</p>&mdash; Orange Book (@orangebook_) 
<a href="https://twitter.com/orangebook_/status/1185182641479225344?ref_src=twsrc%5Etfw">
October 18, 2019</a>
</blockquote>

I'm grateful that I happened to see this tweet because it inspired me to take action and learn 
something new. Through this deep dive, I found a passion for programming 
(outside of my day-to-day job) that had been missing in my life for some years. 

Inspiration is like a currency.

## Getting Started

I decided to learn about 3D graphics programming. I knew absolutely nothing about how graphics 
worked given that I never took a course on the subject in college or otherwise.

I decided to learn about a particular graphics rendering technique called 
[ray tracing](https://en.wikipedia.org/wiki/Ray_tracing_(graphics)#Algorithm_overview).

### 6. Shadows

My sixth rendering is the same ray traced world as the last rendering but with shadows!

The rendering demonstrates using 
[shadow rays](https://graphics.stanford.edu/~cek/rayshade/doc/guide/section2_6_2.html) to determine 
if a point is in a shadow or not. If a point is in shadow, the ray tracer will omit the diffuse
and specular contribution and only use the ambient contribution to shade the pixel.

I also learned about 
[shadow acne](https://www.scratchapixel.com/lessons/3d-basic-rendering/introduction-to-shading/ligth-and-shadows), 
which happens because computers cannot represent floating point numbers very precisely.

![Shadow Rendering](https://raw.githubusercontent.com/austingebauer/go-ray-tracer/master/docs/renderings/world_shadow_3d/world_shadow_3d.png)

### 5. Ray Traced World

My fifth rendering is a ray traced world which includes 3 spheres sitting in a room with walls.

The rendering demonstrates the implementation of a camera with a 
[field of view](https://en.wikipedia.org/wiki/Angle_of_view) and view transformation matrix. 
The view transformation matrix orients the camera by specifying where to look *from* and *to*, and
which way is *up*.

I found the following to be good reads for more on view transformation matrices:
- [World, View and Projection Transformation Matrices](http://www.codinglabs.net/article_world_view_projection_matrix.aspx)
- [Understanding the View Matrix](https://www.3dgep.com/understanding-the-view-matrix/)

![World Rendering](docs/renderings/world_3d/world_3d.png)

### 4. Ray Traced Spheres in 3D

My fourth rendering is my first ever 3D rendering! Producing a 3D rendering was one of those moments that
felt like magic. Those are the moments that keep me excited about programming.

The rendering demonstrates the use of the 
[phong reflection model](https://en.wikipedia.org/wiki/Phong_reflection_model) for pixel shading, computing 
normal vectors on a sphere, and vector reflection.  

![Sphere Rendering](docs/renderings/sphere_3d/sphere_3d.png)
![Sphere Rendering](docs/renderings/sphere_3d/sphereScaleX_3d.png)
![Sphere Rendering](docs/renderings/sphere_3d/sphereScaleY_3d.png)
![Sphere Rendering](docs/renderings/sphere_3d/sphereScaleXRotateZ_3d.png)
![Sphere Rendering](docs/renderings/sphere_3d/sphereShearXYScaleX_3d.png)

### 3. Ray Traced Spheres in 2D

My third rendering is the first one that is actually ray-traced! It's a circle that was produced by
casting rays at a sphere and filling in colored pixels where an intersection occurred.

The rendering demonstrates the use of a 
[line-sphere intersection algorithm](https://en.wikipedia.org/wiki/Line%E2%80%93sphere_intersection) and
transformation matrices (e.g., scaling, rotation, shearing) applied to the spheres.

![Sphere Rendering](docs/renderings/sphere_2d/sphere_2d.png)
![Sphere Rendering](docs/renderings/sphere_2d/sphereScaleX_2d.png)
![Sphere Rendering](docs/renderings/sphere_2d/sphereScaleY_2d.png)
![Sphere Rendering](docs/renderings/sphere_2d/sphereScaleXRotateZ_2d.png)
![Sphere Rendering](docs/renderings/sphere_2d/sphereShearXYScaleX_2d.png)

### 2. Clock Rendering

My second rendering is a clock. The clock has a pixel for each hour of 1-12. 

The rendering demonstrates the use of matrix transforms (e.g., translate, rotate) on points.

You may need to squint in order to see the hour locations on the clock!

![Projectile Rendering](docs/renderings/clock/clock.png)

### 1. Projectile Rendering

My very first rendering is a projectile with a starting point, initial velocity, wind, and gravity.

The rendering demonstrates the use of points and vectors.

![Projectile Rendering](docs/renderings/projectile/projectile.png)
