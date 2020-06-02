class Birds
{
  float xB, yB, zB;  // Birds wing coordinates

  int wingAngle;
  int wingBeat;

  float dirWing;  // direction of Wings
  float dirBody;  // direction og Bird Bodies
  
  PShape bodyB;


  public Birds(float xB, float yB, float zB) {
    this.xB = xB;
    this.yB = yB;
    this.zB = zB;
    
    noStroke();
    bodyB = createShape(SPHERE, 5); // Birds body
    bodyB.setTexture(Textures[2]); // Birds Body Texture

    wingAngle = 0;
    wingBeat = 1;
    dirWing = 5;
  }

  public void drawBirds() {
    pushMatrix();
    translate(xB, yB,zB);

    drawWing();
    scale(-1, 1);
    drawWing();
    
    drawBody();
    
    popMatrix();

    xB += dirWing;
    if (xB >= width - 470)
      dirWing *= -1;
    if (xB <= -650)
      dirWing *= -1;
  }

  public void drawBody() {
    beginShape();
    scale(1.5, 1.5, 6);
    shape(bodyB);
    endShape();
  }

  public void drawWing() {

    pushMatrix();
    scale(45); // Birds size

    rotateX(PI/2);
    rotateY(radians(wingAngle));

    wingAngle += wingBeat; // degree function for flapping
    if (wingAngle >= 45)
      wingBeat *= -1;
    if (wingAngle <= -45)
      wingBeat *= -1;

    beginShape();
    texture(Textures[1]);
    vertex(0, 0, 0, 202, 0);  /// 202 x 183 pixel wing png
    vertex(1, 0, 0, 0, 0);
    vertex(1, 1, 0, 0, 183);
    vertex(0, 1, 0, 202, 183);
    endShape();
    popMatrix();
  }
}
