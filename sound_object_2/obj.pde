

class Objx {
  int poX;
  int poY;
  float ham;
  
  Objx(int x, int y, float h) { 
    poX = x;
    poY = y;
    ham = h;
  }
  void display() {
 
  }
}


void create_obj() {
  float h = map(amp.analyze(), 0, 1, 0, 300);
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
}