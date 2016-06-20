  
import processing.sound.*;
Amplitude amp;
FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];
PVector nStart;
void setup() {
  size(512, 360);
  background(255);
  nStart = new PVector(random(1000), random(1000), random(1000));
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
  
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);
  float analy = map(amp.analyze(), 0, 1, 0, 255);
  stroke(analy,100,analy*2);
  for(int i = 0; i < bands; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  line( i, height, i, height - spectrum[i]*height );
  }
  int maxval = pos_max_val(spectrum);
  if(maxval>=1){
    print(maxval);
    print('\n');
  }
  
  
    float h = map(pos_max_val(spectrum), 0, height, 0, 300);
    for(float radious = h; radious >= 0; radious -= 2){
    fill(1000,analy,analy*2);
    translate(width / 2, height / 2);
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
    translate(width, height);
  }
  
  
  
  //print(spectrum[0]*height);
  //print('\n');
}