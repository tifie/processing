void setup() {
  size(480, 120);
}

void draw() {
  noStroke();
  background(61, 0, 0);
  fill(212, 99, 98);
  for (int y = 0;y <= height;y += 40) {
    for (int x = 0;x <= width;x += 40) {
      quad(x, y-20, x+20, y, x, y+20, x-20, y);
    }
  }
}
