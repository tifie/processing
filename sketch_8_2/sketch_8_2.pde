float t = 0;

void setup() {
  size(600, 300);
  noStroke();
}

void draw() {
  translate(0, height/2);
  background(0);
  for(int wx = 0; wx <= width; wx += 15){
    float x = radians(wx + t);
    float sy = 50 * sin(x);
    float cy = 50 * cos(x);
    float scy = 50 * (2 * sin(x) + 2 * cos(x));

    fill(128);
    ellipse(wx, cy, 10, 10);
    fill(255);
    ellipse(wx, sy, 10, 10);

    fill(128);
    ellipse(wx, -cy, 10, 10);
    fill(255);
    ellipse(wx, -sy, 10, 10);

    fill(128);
    ellipse(wx, scy, 10, 10);
    fill(255);
    ellipse(wx, -scy, 10, 10);
  }
  t++;
}
