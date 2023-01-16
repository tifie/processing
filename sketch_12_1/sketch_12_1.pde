void setup(){
  size(500, 380);
  background(255);
  drawTree(15, width/2, height, -HALF_PI, 100);
}

void drawTree(int n, float x, float y, float a, float len){
  if(n > 0){
    float x2 = x + len * cos(a);
    float y2 = y + len * sin(a);
    line(x, y, x2, y2);
    drawTree(n - 1, x2, y2, a + PI/4, len * 0.7);
    drawTree(n - 1, x2, y2, a - PI/4, len * 0.7);
  }
}