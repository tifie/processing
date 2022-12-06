size(500, 200);
noStroke();
colorMode(HSB);
background(148, 255, 255);
for(int y = 0; y <= height; y += 52){
  for(int x = -15; x <= width; x += 30){
    fill(y / 13 + 148, 255, 255);
    triangle(x + 15, y, x, y + 26, x + 30, y + 26);
    fill((y + 26) / 13 + 148, 255, 255);
    triangle(x, y + 26, x + 15, y + 52, x - 15, y + 52);
  }
}