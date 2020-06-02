class Plane {

  float xP, yP, zP, moveP;
  PShape bodyP; // For using the texture we need this shape creater
  PShape engineP;


  public Plane(float xP, float yP, float zP) {
    this.xP = xP;
    this.yP = yP;
    this.zP = zP;

    noStroke();
    bodyP = createShape(SPHERE, 20);  // Creating Plane Shape
    bodyP.setTexture(Textures[4]);    // 3D texture

    engineP = createShape(SPHERE, 3); // Creating Engine Shape
    engineP.setTexture(Textures[5]);
    
    moveP = 12;
  }

  public void drawPlane() {

    translate(xP, yP);

    pushMatrix();
    scale(11, 2, 2);
    shape(bodyP);

    drawWings(1);
    drawWings(-1);

    drawWingEnds(1);
    drawWingEnds(-1);

    drawTail();

    drawEngines(3, 6, 50);
    drawEngines(0, 0, -100);

    popMatrix();
  } 

  public void drawEngines(float eX, float eY, float eZ) {   // engine Reverse, X Coordinate, Y Coordinate
    translate(eX, eY, eZ);
    pushMatrix();
    scale(1, 2, 2);
    shape(engineP);
    popMatrix();
  }

  public void drawWings(int wR) {  // wing Reverse
    beginShape();
    texture(Textures[3]);
    int wWidth = Textures[3].width;
    int wHeight = Textures[3].height;
    vertex(0, 0, 0 * wR, 0, 0);
    vertex(5, 0, 0  * wR, wWidth, 0);
    vertex(5, 0, 90 * wR, wWidth, wHeight);
    vertex(0, 0, 90 * wR, 0, wHeight);
    endShape();
  }

  public void drawWingEnds(int eR) { // end Reverse
    beginShape();
    texture(Textures[7]);
    int eWidth = Textures[7].width;
    int eHeight = Textures[7].height;
    vertex(0, -20, 90* eR, 0, 0);
    vertex(2, -20, 90* eR, eWidth, 0);
    vertex(5, 0, 90* eR, eWidth, eHeight);
    vertex(0, 0, 90* eR, 0, eHeight);
    endShape();
  }

  public void drawTail() {
    beginShape();
    texture(Textures[6]);
    int tWidth = Textures[6].width;  // we need with annd height because the perfect match with texture and shape
    int tHeight = Textures[6].height;
    vertex(-14, -70, 0, 0, 0);
    vertex(-15, -70, 0, tWidth, 0);
    vertex(-15, -10, 0, tWidth, tHeight);
    vertex(-10, -10, 0, 0, tHeight);
    endShape();
  }

  public void movePlane(int xDirP, int yDirP, int zDirP) { // z, y, z directions of Plane for moving the plane
    xP += moveP * xDirP;
    yP += moveP * yDirP;
    zP += moveP * zDirP;
  }
}
