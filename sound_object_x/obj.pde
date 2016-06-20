

class Objx {
  float poX;
  float poY;
  float ham;
  float speedX;
  float speedY;
  int ran;
  float ghue;
  float colorinc;
  Objx(float h, int ran, float huug) { 
    poX = 0;
    poY = 0;
    ham = h;
    ghue = huug;
    colorinc = 0.2;
 
    
    switch(ran) {
      case 0: 
          speedX = map(h, 0, h_con, -1, 0.1);
          speedY = map(h, 0, h_con, 0.1, 1);
        break; 
      case 1: 
          speedX = map(h, 0, h_con, 0.1, 1);
          speedY = map(h, 0, h_con, -1, 0.1);
        break;
      case 2: 
          speedX = map(h, 0, h_con, -1, 1);
          speedY = map(h, 0, h_con, -1, 1);
        break;
      case 3: 
          speedX = map(h, 0, h_con, 0.1, 1);
          speedY = map(h, 0, h_con, 0.1, 1);
        break;
      case 4: 
          speedX = map(h, 0, h_con, 0.1, 1);
          speedY = map(h, 0, h_con, 0.1, 1);
        break;
      default:  
          speedX = map(h, 0, h_con, -1, 1);
          speedY = map(h, 0, h_con, -1, 1);
        break;
    }

  }
  void display() {
  translate(poX, poY);
  //float h = map(amp.analyze(), 0, 1, 0, 300);
  for(float radious = ham; radious >= 0; radious -= 2){
    //float sat = map(sq(radious), 0, sq(250), 0, 100);
    fill(hue, 60, 100);
    beginShape();
    for(float radian = 0; radian < TWO_PI; radian += PI / 65){
      float xOffset = radious * cos(radian);
      float yOffset = radious * sin(radian);
      float rNoise = map(noise(xOffset * 0.01 + nStart.x, yOffset * 0.01 + nStart.y, frameCount * 0.03 + nStart.z), 0, 1, -50, 50);
      float x, y;
        x = (radious + rNoise) * cos(radian);
        y = (radious + rNoise) * sin(radian);
     
      vertex(x, y);    
    }
    endShape(CLOSE);
  }
    update();

    translate(-poX, -poY);
  }
  
  void update(){
    if(poX>(width/2)  || poX<(width/-2)){  speedX = (-0.99)*speedX;}
    if(poY>(height/2) || poY<(height/-2)){  speedY = (-0.99)*speedY;}
    poX=poX+speedX;
    poY=poY+speedY;
    
    
    
    
    //ghue += colorinc;
  
    //if(ghue > 360){
    //  ghue = 359;
 
    //  colorinc = colorinc*-1;
    //}
    //if(ghue < 210){
    //  ghue = 211;
  
    //  colorinc = colorinc*-1;
    //}
 
    
    
    
  }
  
  
}
 