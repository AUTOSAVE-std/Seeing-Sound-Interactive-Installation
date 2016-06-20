//Syphon
import codeanticode.syphon.*;
PGraphics canvas;
SyphonServer server;
//endSyphon

import processing.sound.*;
Amplitude amp;
AudioIn in;
AudioIn in2;
PVector nStart;
float hue;
ArrayList<Objx> list;
static int h_con = 300;

//broken
FFT fft;
int bands = 128;
float[] spectrum = new float[bands];
//end broken


void setup(){
   size(512, 512);
   //fullScreen();
 
  nStart = new PVector(random(1000), random(1000), random(1000));
  background(255);
  hue = 0;
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  
  fft = new FFT(this, bands);
  in2 = new AudioIn(this, 0);
 
  in.start();
  in2.start();
  amp.input(in);
  fft.input(in2);
  
  list= new ArrayList<Objx>();
  


}

void draw(){
  background(30);
   fft.analyze(spectrum);
    //for(int i = 0; i < bands; i++){
      //line( i, height, i, height - spectrum[i]*height );
  //}
  int positionmaxval = pos_max_val(spectrum);
  if(positionmaxval>=1){
    print(positionmaxval);
    print('\n');
  }



  
  float h = map(amp.analyze(), 0, 1, 0, h_con);
  
  colorMode(RGB, 255, 255, 255);
  fill(30, 30);
  rect(0, 0, width , height);
  colorMode(HSB, 360, 60, 100);
  translate(width / 2, height / 2);
 
  
  for(float radious = h; radious >= 0; radious -= 2){
    stroke(180);
    noFill();
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
    Objx first = new Objx(h,int(random(4)),hue,positionmaxval);
    list.add(first);
  }

  DAM_display();
  
  
}
 