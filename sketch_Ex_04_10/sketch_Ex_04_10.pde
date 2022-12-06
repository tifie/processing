void setup() {
  size(480, 120);
}

void draw() {
  background(0);
  noStroke();
  fill(255, 140);
  for (int y = 0;y <=  height;y += 40) {
    for (int x = 0; x <=  width;x += 40) {
      ellipse(x, y, 40, 40);
    }
  }
}
