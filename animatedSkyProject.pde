float camZ = 0;

PImage[] Textures = new PImage[10]; // Creating an array for store the images

ArrayList<Clouds> clouds = new ArrayList();
ArrayList<Birds> birds = new ArrayList();

Sun sun;
Plane plane;

// Positions of Sun
float xS = -630;
float yS = 100;
float zS = -200;

//Positions of Plane
float xP = -600;
float yP = 800;
float zP = 0;

void setup() {
  size(1200, 800, P3D);
  Textures[0] = loadImage("skyImg.jpg");      // Sky Image
  Textures[1] = loadImage("wingImg.gif");     // Wing Png Image
  Textures[2] = loadImage("birdBodyImg.jpg"); // Bird Bodies image
  Textures[3] = loadImage("wingsImgP.jpg");   // Plane Wings Image
  Textures[4] = loadImage("pImg.jpg");        // Plane Body Image
  Textures[5] = loadImage("engineImg.jpg");   // Plane Engine Image
  Textures[6] = loadImage("tailBauImg.jpg");  // Plane Tail Image
  Textures[7] = loadImage("wingsEndImg.jpg"); // Plane Wing Ends Image
  Textures[8] = loadImage("cloudsImg.jpg");   // Cloud Image
  Textures[0].resize(1200, 800);

  camZ = (height/2) / tan((PI*60.0)/360.0);

  sun = new Sun(xS, yS, zS, 45);

  for (int i = 0; i < 10; i++) // Creating random clouds
  {
    Clouds C = new Clouds(random(-600,200), i * random(0, 30));
    clouds.add(C);
  }

  for (int j = 0; j < 5; j++) { // Creating random birds
    Birds B = new Birds(random(-450, 450), random(490, 1000), random(20, 120));
    birds.add(B);
  }

  plane = new Plane(xP, yP, zP);
}


void draw() {
  background(Textures[0]); 
  textSize(20);
  fill(0,255,0);
  text((millis()/1000) + " sec.", -500, 50);  // calculate seconds with : milis()/1000 amd position -500,50
  camera(0, 0.0, camZ, //default camera position
    0, 120, 500, //where it is looking to
    0, 1, 0); //eye openness

  rotateX(rotX + distY);
  rotateY(rotY + distX);

  if (keyPressed)
    planeKeyPressed();

  sun.drawSun();

  for (int i = 0; i < clouds.size(); i++)
  {
    clouds.get(i).drawClouds();
  }

  for (int j = 0; j < birds.size(); j++) {
    birds.get(j).drawBirds();
    
  }

  plane.drawPlane();
}

float rotX = 0, rotY = 0;
float lastX, lastY;
float distX, distY;

void mousePressed()
{
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged()
{
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}

void mouseReleased()
{
  rotX += distY;
  rotY += distX;
  distX = distY = 0;
}


void planeKeyPressed()
{
  if (key != CODED)
    return;

  switch(keyCode)
  {
  case UP:
    plane.movePlane(0, -1, 0);
    break;
  case DOWN:
    plane.movePlane(0, 1, 0);
    break;
  case RIGHT:
    plane.movePlane(1, 0, 0);
    break;
  case LEFT:
    plane.movePlane(-1, 0, 0);
    break;
  }
}
