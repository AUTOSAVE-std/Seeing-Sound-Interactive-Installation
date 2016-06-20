class Objx {
  float poX;
  float poY;
  float ham;
  float speedX;
  float speedY;
  int ran;
  float ghue;
  float glight;
  float colorinc;
  int range;
  //int switchcolor;
  //float leapvalcolor;
  Objx(float h, int ran, float huug, int btw) { 
    poX = 0;
    poY = 0;
    ham = h;
    ghue = huug;
    
    colorinc = 0.3;
    //range = floor(btw/25.6);
    range = btw%6;
    
    //if(huug<=0.1){
    //  switchcolor = 1;
    //  //ghue white blue 200 50 100 to 200 50 100
    //  ghue = 200;
    //  glight = 100;
    //} else if(huug<=0.2){
    //  switchcolor = 2;
    //  ghue = 342;
    //  glight = 100;
    //} else { 
    //  switchcolor = 3;
    //  leapvalcolor=0.5;
    //  colorinc = 0.08;
    //}
    
    
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
  canvas.translate(poX, poY);
canvas.colorMode(HSB, 360, 100, 100);

if(ghue<=0.05) canvas.stroke(238,100,100);
else if(ghue<=0.1) canvas.stroke(238,80,100);
else if(ghue<=0.15) canvas.stroke(238,50,100);
else if(ghue<=0.2) canvas.stroke(238,25,100);
else if(ghue<=0.25) canvas.stroke(238,10,100);
else if(ghue<=0.3) canvas.stroke(230,0,100);
else if(ghue<=0.35) canvas.stroke(360,10,100);
else if(ghue<=0.4) canvas.stroke(360,25,100);
else if(ghue<=0.45) canvas.stroke(360,50,100);
else if(ghue<=0.5) canvas.stroke(360,70,100);
else canvas.stroke(360,100,100);
  
  //if(switchcolor==3){
  //  canvas.colorMode(HSB, 360, 100, 100);
  //  color red = color(340, 100, 100);
  //  color blue = color(200, 100, 100);
  //  color trans = lerpColor(blue, blue, 1);
  //  canvas.stroke(trans);
  //}else {canvas.stroke(ghue,glight,100);}
  if(range==0)  drawCircle(0,0,ham);
  else if(range==1) polygon(0,0,ham,3);
  else if(range==2) polygon(0,0,ham,4);
  else if(range==3) polygon(0,0,ham,5);
  else if(range==4) polygon(0,0,ham,6);
  else if(range>4) polygon(0,0,ham,7);
  canvas.stroke(hue, 100, 100);
  update();
  canvas.translate(-poX, -poY);
  }
  
  void update(){
    if(poX>(width/2)  || poX<(width/-2)){  speedX = (-1.0)*speedX;}
    if(poY>(height/2) || poY<(height/-2)){  speedY = (-1.0)*speedY;}
    poX=poX+speedX;
    poY=poY+speedY;

    //if(switchcolor==1 || switchcolor==2){
    //  glight += colorinc;
    //  if(glight < 0 || glight > 100){
    //    colorinc = colorinc*-1;
    //  }
      
    //} else {
    //  leapvalcolor +=colorinc;
    //  if(leapvalcolor<=0 || leapvalcolor>=1) {colorinc = colorinc*-1; } 
    //}
    
    
    
    
    
  }
  
  void drawCircle(float x, float y, float radius){
    canvas.ellipse(x,y,radius,radius);
  }
  
  void polygon(float x, float y, float radius, int npoints) {
    canvas.pushMatrix();
    canvas.rotate(frameCount / -100.0);
    float angle = TWO_PI / npoints;
    canvas.beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      canvas.vertex(sx, sy);
    }
    canvas.endShape(CLOSE);
    canvas.popMatrix();
  }
  
 
}
 