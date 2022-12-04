void setup() {
  size(360, 180);
}

void draw() {
  for (int y = 0; y < height;y += 20) {
    for (int x = y * 2; x < width;x += 40) {
      fill(128, 50);
      rect(x, y, 40, 20);
    }
  }
}
