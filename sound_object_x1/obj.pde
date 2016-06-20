class Objx {
  float poX;
  float poY;
  float ham;
  float speedX;
  float speedY;
  int ran;
  float ghue;
  float colorinc;
  int range;
  Objx(float h, int ran, float huug, int btw) { 
    poX = 0;
    poY = 0;
    ham = h;
    ghue = huug;
    colorinc = 0.2;
    //range = floor(btw/25.6);
    range = btw%6;
    
    switch(ran) {
      case 0: 
          speedX = map(h, 0, h_con, -1, -0.1);
          speedY = map(h, 0, h_con, 0.1, 1);
        break; 
      case 1: 
          speedX = map(h, 0, h_con, 0.1, 1);
          speedY = map(h, 0, h_con, -1, -0.1);
        break;
      case 2: 
          speedX = map(h, 0, h_con, 1, 0.1);
          speedY = map(h, 0, h_con, -0.1, -1);
        break;
      case 3: 
          speedX = map(h, 0, h_con, -0.1, -1);
          speedY = map(h, 0, h_con, 1, 0.1);
        break;
      default:  
          speedX = map(h, 0, h_con, -1, 1);
          speedY = map(h, 0, h_con, -1, 1);
        break;
    }

  }
  
  void display() {
  translate(poX, poY);

  stroke(ghue, 60, 100);
  //noStroke();
  if(range==0)  drawCircle(0,0,ham);
  else if(range==1) polygon(0,0,ham,3);
  else if(range==2) polygon(0,0,ham,4);
  else if(range==3) polygon(0,0,ham,5);
  else if(range==4) polygon(0,0,ham,6);
  else if(range>4) polygon(0,0,ham,7);
  stroke(hue, 100, 100);
  
  //for(float radious = ham; radious >= 0; radious -= 2){ 
  //  noFill();
  //  beginShape();
  //  for(float radian = 0; radian < TWO_PI; radian += PI / 65){
  //    float xOffset = radious * cos(radian);
  //    float yOffset = radious * sin(radian);
  //    float rNoise = map(noise(xOffset * 0.01 + nStart.x, yOffset * 0.01 + nStart.y, frameCount * 0.03 + nStart.z), 0, 1, -50, 50);
  //    float x, y;
  //      x = (radious + rNoise) * cos(radian);
  //      y = (radious + rNoise) * sin(radian);
     
  //    vertex(x, y);    
  //  }
  //  endShape(CLOSE);
  //}
    update();

    translate(-poX, -poY);
  }
  
  void update(){
    if(poX>(width/2)  || poX<(width/-2)){  speedX = (-1.0)*speedX;}
    if(poY>(height/2) || poY<(height/-2)){  speedY = (-1.0)*speedY;}
    poX=poX+speedX;
    poY=poY+speedY;

    ghue += colorinc;
  
    if(ghue > 360){
      ghue = 359;
 
      colorinc = colorinc*-1;
    }
    if(ghue < 210){
      ghue = 211;
  
      colorinc = colorinc*-1;
    }
    
  }
  
  void drawCircle(float x, float y, float radius){
    ellipse(x,y,radius,radius);
  }
  
  void polygon(float x, float y, float radius, int npoints) {
    pushMatrix();
    rotate(frameCount / -100.0);
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
 
}
 