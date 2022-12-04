void setup() {
  size(400,400);
}

void draw() {
  fill(#2798ff);
  rect(140, 80, 200, 340);
  for (int i = 0; i < 3;i++) {
    for (int j = 0;j < 4;j++) {
      fill(255);
      rect(160 + 60 * i,110 + 60 * j, 35, 35);
    }
  }
  fill(#2798ff);
  rect(40, 230, 260, 170);
  for (int i = 0; i < 4;i++) {
    for (int j = 0;j < 2;j++) {
      fill(255);
      rect(60 + 60 * i,250 + 60 * j, 35, 35);
    }
  }
}
