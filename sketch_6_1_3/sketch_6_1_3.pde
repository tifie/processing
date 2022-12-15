size(1200, 600);
background(0);
for(int y = 0; y < height; y += random(0, 70)){
  for(int x = 0; x < width; x += random(30, 70)){
    float r = random(height % 255);
    float g = random(width % 255);
    float b = random((height + width) % 255);
    stroke(r, g, b, 200);
    line(x, y, x, -y);
  }
}