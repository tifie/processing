size(500, 200);
background(255);
strokeWeight(2);
stroke(0, 96, 202, 255);
fill(255, 0);
for (int y = 0; y <= height; y += 80) {
  for (int x = 0; x <=  width; x += 80) {
    ellipse(x, y, 80, 80);
    ellipse(x + 40, y + 40, 80, 80);
  }
}

