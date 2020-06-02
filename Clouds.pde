class Clouds
{
  float xC, yC, zC, speedC;
  float sizeC;
  PShape shapeClouds;

  public Clouds(float x, float y)
  {
    xC = x;
    yC = y;
     
    sizeC = 25;
    noStroke();
    shapeClouds = createShape(SPHERE, sizeC);  // creating Cloud shape
    shapeClouds.setTexture(Textures[8]); // Give the Texture to the shape
    speedC = random(0.5,1.5);
  }

  public void drawClouds()
  { 
    pushMatrix();
    translate(xC,yC);
    makingClouds(100, 100, 100);  // First Sphere
    makingClouds(125, 100, 100);  // Second Sphere
    makingClouds(150, 100, 100);  // Third Sphere
    makingClouds(115, 125, 100);  // Fourth Sphere
    makingClouds(140, 125, 100);  // Fifth Sphere
    popMatrix();

    if (xC > width - 770) {
      xC = -750; 
    }
    
    xC += speedC; 
  }

  public void makingClouds(float xF, float yF, float zF ) {
    pushMatrix();
    translate(xF, yF, zF);
    scale(1, 1, 1);
    shape(shapeClouds);
    popMatrix();
  }
 
}
