class Sun {

  float xS, yS, zS, sizeS, speedS;
  float redColor = 255;
  float greenColor = 183;
  float blueColor = 8;
  float colorFadeRateRedGreen = 1; // We increase the green color and decrease the red color for match grey color
  float colorFadeRateBlue = 1; // We increase the blue color for match grey color
  int fadeTimeInFrames;

  public Sun(float xS, float yS, float zS, float sunSize) {
    this.xS = xS;
    this.yS = yS;
    this.zS = zS;
    this.sizeS = sunSize;

    frameRate(60); // Specifies the number of frames to be displayed every second

    fadeTimeInFrames = 60 * 79;  
    speedS = (width - 50) / (float)fadeTimeInFrames;
    colorFadeRateRedGreen = 40 / (float)fadeTimeInFrames;  // Seperate red,green and blue colors increasing because blue should increase faster for grey color
    colorFadeRateBlue = 100 / (float)fadeTimeInFrames;
  }

  public void drawSun() {

    pushMatrix();
    translate(xS, yS, zS);
    fill(redColor, greenColor, blueColor);
    noStroke();
    //lights();
    //directionalLight(redColor, greenColor, blueColor, 0, height, 0);
    
    sphere(sizeS);
    popMatrix();
    
    if ( redColor >= 201) {
      redColor -= colorFadeRateRedGreen;
    }

    if ( greenColor <= 198) {
      greenColor += colorFadeRateRedGreen;
    }

    if ( blueColor <= 195) {
      blueColor += colorFadeRateBlue;
    }

    if (xS > width - 575)
    {
      noLoop();
    }
    
    xS += speedS;
  }
}
