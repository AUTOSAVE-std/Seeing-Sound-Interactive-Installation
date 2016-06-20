 
import processing.sound.*;
Amplitude amp;
AudioIn in;

void setup() {
  //fullScreen();
  size(700,700);
  colorMode(HSB, 100, 100, 100);
  //noLoop();
  rectMode(CENTER);
  //noStroke();
  smooth();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  
  
}
 
void draw() {
  //println(amp.analyze());
  background(0, 0, 0);
  paper(50);  // normal value
  float h = map(amp.analyze(), 0, 1, height, 0);
  
  fill(0,40,100);
 
  if(amp.analyze()<=0.01) {noStroke();} else {
  stroke(329,68,83);
  strokeWeight(12);
  }
  
  ellipse(width/2, height/2, (h*1.5)-height, h-height);
  //ellipse(width/3, height/3, (h*1.5)-height, h-height);
  print(h);
  print("\n");
}

void paper(int in_val) {
  colorMode(HSB, 100, 100, 100);
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(85-10, 85+10), in_val);
      rect(i, j, 2, 2);
    }
  }
 
  for (int i = 0; i<30; i++) {
    fill(random(40, 60), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}