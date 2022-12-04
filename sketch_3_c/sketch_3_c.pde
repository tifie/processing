void setup() {
  size(360, 180);
}

void draw() {
  for (int n = 0; n < height;n += 20) {
    rect(n*2-40, n, 40, 20);
    rect(n*2, n, 40, 20);
    rect(n*2+40, n, 40, 20);
  }
}
