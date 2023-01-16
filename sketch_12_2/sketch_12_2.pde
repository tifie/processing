void setup() {
  size(640, 540);
  background(255);
  drawRect(9, 570, 20, 500);
}

void drawRect(int n, float x, float y, float size){
  if(n == 1){
    rect(x, y, -size, size);
  }else{
    float nsize = size/2;
    rect(x, y, -nsize, nsize);
    drawRect(n - 1, x, y + nsize, nsize);
    drawRect(n - 1, x - nsize, y, nsize);
    drawRect(n - 1, x - nsize, y + nsize, nsize);
  }
}