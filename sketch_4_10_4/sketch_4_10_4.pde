size(500, 200);
background(255);
strokeWeight(2);
for (int y = 0; y <= height; y += 80) {
  for (int x = 0; x <= width; x += 80) {
    fill(255, 0);
    ellipse(x, y, 80, 80);
    ellipse(x + 40, y + 40, 80, 80);
    fill(#e5e600);
    arc(x, y, 80, 80, 0, HALF_PI, OPEN);
    arc(x + 40, y + 40, 80, 80, PI, HALF_PI + PI, OPEN);
    fill(#5ac1c8);
    arc(x, y, 80, 80, HALF_PI, PI, OPEN);
    arc(x + 40, y + 40, 80, 80, HALF_PI + PI, TWO_PI, OPEN);
    arc(x, y, 80, 80, HALF_PI + PI, TWO_PI, OPEN);
    arc(x + 40, y + 40, 80, 80, HALF_PI, PI, OPEN);
    fill(#1d4865);
    arc(x, y, 80, 80, PI, HALF_PI + PI, OPEN);
    arc(x + 40, y + 40, 80, 80, 0, HALF_PI, OPEN);
  }
}
