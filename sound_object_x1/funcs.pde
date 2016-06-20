void DAM_display(){
  for (int i = list.size()-1; i >= 0; i--) { 
    Objx showw = list.get(i);
    showw.display();
  }
}
 
void paper() {

  noStroke();
  for (int i = 0; i<width-1; i+=20) {
    for (int j = 0; j<height-1; j+=20) {
      fill( 255 );
      rect(i, j, 1, 1);
    }
  }
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