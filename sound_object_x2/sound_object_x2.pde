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
  //Syphon
  size(512,512, P3D);
  canvas = createGraphics(512, 512, P3D);
  //endSyphon
  
  
   //fullScreen();
 
  nStart = new PVector(random(1000), random(1000), random(1000));
  background(30);
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
  
  //Syphon
  server = new SyphonServer(this, "Processing Syphon");


}

void draw(){
  canvas.beginDraw();
  fft.analyze(spectrum);
  paper();
  float h = map(amp.analyze(), 0, 1, 0, h_con);
  
  canvas.colorMode(RGB, 255, 255, 255);
  canvas.fill(30, 30);
  canvas.rect(0, 0, width , height);
  canvas.colorMode(HSB, 360, 100, 100);
  canvas.translate(width / 2, height / 2);
 
  
  for(float radious = h; radious >= 0; radious -= 2){
    canvas.stroke(180);
    canvas.noFill();
    canvas.beginShape();
    for(float radian = 0; radian < TWO_PI; radian += PI / 65){
      float xOffset = radious * cos(radian);
      float yOffset = radious * sin(radian);
      float rNoise = map(noise(xOffset * 0.01 + nStart.x, yOffset * 0.01 + nStart.y, frameCount * 0.03 + nStart.z), 0, 1, -50, 50);
      float x, y;
        x = (radious + rNoise) * cos(radian);
        y = (radious + rNoise) * sin(radian);
     
      canvas.vertex(x, y);    
    }
    canvas.endShape(CLOSE);
  }
  
  

  

 
  if(h>10 && frameCount %25 == 0 ) {
    int positionmaxval = pos_max_val(spectrum);
    float hue = map(positionmaxval, 0, bands, 0, 3);
    if(list.size() >= 50) {list.remove(0);}
    Objx first = new Objx(h,int(random(4)),hue,positionmaxval);
    list.add(first);
     
  }

  DAM_display();
  
  
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
  
}
 