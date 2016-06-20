import processing.sound.*;
Amplitude amp;
AudioIn in;
PVector nStart;
float hue;
ArrayList<Objx> list;
static int h_con = 300;
void setup(){
  //size(500, 500);
   fullScreen();
   //noSmooth();
  noStroke();
  nStart = new PVector(random(1000), random(1000), random(1000));
  background(30);
  hue = 0;
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  list= new ArrayList<Objx>();

}

void draw(){
  paper(255);
  float h = map(amp.analyze(), 0, 1, 0, h_con);
  
  colorMode(RGB, 255, 255, 255);
  fill(30, 30);
  rect(0, 0, width , height);
  colorMode(HSB, 360, 60, 100);
  translate(width / 2, height / 2);
 
  
  for(float radious = h; radious >= 0; radious -= 2){
    float sat = map(sq(radious), 0, sq(250), 0, 100);
    fill(hue, 100, 100);
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
  
  
  hue += 0.3;
  if(hue > 360){
    hue -= 360;
  }
  
  
 
  if(h>10 && frameCount %100 == 0 ) {
    Objx first = new Objx(h,int(random(4)),hue);
    list.add(first);
  }

  for (int i = list.size()-1; i >= 0; i--) { 
    //first.display();
    Objx showw = list.get(i);
    showw.display();
  }
  
  
}



void paper(int in_val) {

  noStroke();
  for (int i = 0; i<width-1; i+=20) {
    for (int j = 0; j<height-1; j+=20) {
      fill( 200                                                         );
      rect(i, j, 1, 1);
    }
  }
 
  //for (int i = 0; i<30; i++) {
  //  fill(random(40, 60), random(in_val*2.5, in_val*3));
  //  rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  //}
}