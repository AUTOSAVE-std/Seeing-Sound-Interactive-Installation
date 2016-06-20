//retuen index position of max val
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