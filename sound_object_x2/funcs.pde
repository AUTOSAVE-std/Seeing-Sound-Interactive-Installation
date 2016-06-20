void DAM_display(){
  for (int i = list.size()-1; i >= 0; i--) { 
    Objx showw = list.get(i);
    showw.display();
  }
}
 
void paper() {

  canvas.noStroke();
  for (int i = 0; i<width-1; i+=20) {
    for (int j = 0; j<height-1; j+=20) {
      canvas.fill( 255 );
      canvas.rect(i, j, 1, 1);
    }
  }
  
  //for (int i = 0; i<width-1; i+=2) {
  //  for (int j = 0; j<height-1; j+=2) {
  //    canvas.fill(random(85-10, 85+10), 50);
  //    canvas.rect(i, j, 2, 2);
  //  }
  //}
 
  //for (int i = 0; i<30; i++) {
  //  canvas.fill(random(40, 60), random(30*2.5, 50*3));
  //  canvas.rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  //}
  
  
  
  
}

int pos_max_val(float[] array) {
  int maxIndex = 0;
    if (array.length == 0) {
    println("nothing in the array.");
  
  } else {
    float maxValue = array[0];
    for (int i = 1; i < array.length; i++) {
      if (array[i] > maxValue) {
    maxValue = array[i];
    maxIndex = i;
      }
    }
  }
  return maxIndex;
}