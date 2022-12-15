int t = 0;
float g = 0.0392, v = 0, y = 0;

void setup() {
  size(300, 400);
}

void draw() {
  background(0);
  t++;
  v = g * t;
  y = g * sq(t) / 2;
  ellipse(width/2, y, 10, 10);
  if(y >= height){
    t = 0;
  }
}
