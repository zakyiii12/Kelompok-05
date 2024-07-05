/**
 * Custom Lighting
 * Modified by ChatGPT. 
 * 
 * Display a sphere with different kinds of lights.
 */

void setup() {
  size(640, 360, P3D);
  noStroke();
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  
  // Red point light on the right
  pointLight(255, 0, 0, // Color
             200, -150, 0); // Position

  // Green directional light from the left
  directionalLight(0, 255, 0, // Color
                   -1, 0, 0); // The x-, y-, z-axis direction

  // Blue spotlight from the top
  spotLight(0, 0, 255, // Color
            0, -200, 200, // Position
            0, 1, -1, // Direction
            PI / 3, 2); // Angle, concentration
  
  // Rotate the sphere based on mouse position
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateX(map(mouseY, 0, height, 0, PI));
  
  sphere(150);
}
