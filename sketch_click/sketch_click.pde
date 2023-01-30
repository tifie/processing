float splitX = 0;
float wx = 0;
float wy = 0;
float wAngle = 0;
float angleSpeed = 0;
int cnt = 0;
boolean isSplitlock;

void setup() {
  size(600, 500);
  splitX = float(width) / 3;
  angleSpeed = 0.01;
  wx = splitX / 2;
  frameRate(30);
}

void draw() {
  background(0);
  windowline();
  fill(128);
  noStroke();
  wy = (wy + 0.5) % (height + 20);
  wAngle = (wAngle + angleSpeed) % 360;
  float cx1 = wx * cos(wAngle) * 2 / 3;
  float cx2 = wx * cos(wAngle - angleSpeed * 18) * 2 / 3;
  if(floor(cx1) == 0 || ceil(cx1) == 0){
    cnt++;
    println(wAngle);
  }
  text(cnt, 40, 360);
  text(angleSpeed, 40, 380);
  // println(wx, cx, floor(cx), ceil(cx), wAngle);
  ellipse(wx + cx2, wy - 15, 10, 10);
  ellipse(wx + cx1, wy, 10, 10);
}

void windowline(){
  stroke(64);
  line(splitX, 0, splitX, height);
  stroke(230);
  line(wx, 0, wx, height);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX >= splitX - 5 && splitX + 5 >= mouseX) {
      isSplitlock = true;
    }
  }
  if (mouseButton == RIGHT){
    angleSpeed = angleSpeed + 0.01;
  }
}

void mouseDragged() {
  if (isSplitlock) {
    if (mouseX < width/3) {
      splitX = float(width) / 3;
    }else if (mouseX > width/2) {
      splitX = float(width) / 2;
    }else{
      splitX = mouseX;
    }
    wx = splitX / 2;
  }
}

void mouseReleased() {
  isSplitlock = false;
}