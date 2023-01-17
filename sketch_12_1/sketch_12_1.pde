void setup(){
  size(500, 380);
  background(255);
  drawTree(18, width/2, height, -HALF_PI, 60);
}

void drawTree(int n, float x, float y, float a, float len){
  if(n > 0){
    float x2 = x + len * cos(a);
    float y2 = y + len * sin(a);
    drawTree(n - 1, x2, y2, a + PI/5, len * 0.85);
    drawTree(n - 1, x2, y2, a - PI/5, len * 0.85);
    float gray = map(n, 18, 1, 0, 150);
    float opacity = map(n, 1, 18, 0, 255);
    stroke(gray, opacity);
    line(x, y, x2, y2);
  }
}