void setup(){
  size(640, 460);
  background(255);
  drawTree(15, width/2, height - height/6, -HALF_PI, 60);
}

void drawTree(int n, float x, float y, float a, float len){
  if(n > 0){
    float x2 = x + len * cos(a);
    float y2 = y + len * sin(a);
    drawTree(n - 1, x2, y2, a + PI/5, len * 0.87);
    drawTree(n - 1, x2, y2, a - PI/5, len * 0.87);
    float gray = map(n, 15, 1, 0, 100);
    float opacity = map(n, 1, 15, 30, 255);
    stroke(gray, opacity);
    line(x, y, x2, y2);
  }
}