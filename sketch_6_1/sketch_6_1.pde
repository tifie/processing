size(1200, 720);
noStroke();
background(0);
for (int i = 0; i < 1000; i++){
  float x = random(width);
  float y = random(height);
  float d = random((height * width) / (height * 15));
  float r = random(0, width * width / 255);
  float g = random(0, height / 255);
  float b = random(0, (width * height) % 255);
  float c = random(60, 100);
  fill(r, g, b, c);
  ellipse(x, y, d, d);
}