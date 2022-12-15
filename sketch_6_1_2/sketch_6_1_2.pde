size(1200, 300);
stroke(0);
background(0);
colorMode(HSB);
for (int y = 0; y < height; y += 30) {
  for (int x = 0; x < width; x += 30) {
    float b = random(15, 255);
    fill(23, 255, b);
    rect(x, y, 25, 25, 7);
  }
}