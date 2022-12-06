size(500, 200);
background(255);
strokeWeight(2);
for (int y = 0; y <= height; y += 80) {
  for (int x = 0; x <= width; x += 80) {
    fill(#85ba00, 60);
    ellipse(x, y, 80, 80);
    fill(#11553a, 60);
    ellipse(x + 40, y + 40, 80, 80);
    fill(255, 0);
    arc(x, y, 80, 80, 0, HALF_PI, OPEN);
    arc(x + 40, y + 40, 80, 80, PI, HALF_PI + PI, OPEN);
    arc(x, y, 80, 80, HALF_PI, PI, OPEN);
    arc(x + 40, y + 40, 80, 80, HALF_PI + PI, TWO_PI, OPEN);
    arc(x, y, 80, 80, HALF_PI + PI, TWO_PI, OPEN);
    arc(x + 40, y + 40, 80, 80, HALF_PI, PI, OPEN);
    arc(x, y, 80, 80, PI, HALF_PI + PI, OPEN);
    arc(x + 40, y + 40, 80, 80, 0, HALF_PI, OPEN);
  }
}
