class Period_ball {
  float wy;
  float cx;
  float pcx;
  float wAngle;
  float angleSpeed = 5;

  Period_ball (float wy, float wAngle) {
    this.wy = wy;
    this.wAngle = wAngle;
  }

  void calc() {
    wy = (wy + speed) % (height);
    wAngle = (wAngle + angleSpeed) % 360;
    cx = wx * sin(radians(wAngle)) * 3 / 4;
  }

  void draw() {
    fill(128);
    noStroke();
    ellipse(wx + cx, wy, 10, 10);
  }

  void checkSplitLine() {
    if (0 > cx && pcx >= 0 ||
      0 > pcx && cx >= 0){
      vals.addTotal();
    }
    pcx = cx;
  }

  float getWY() {
    return this.wy;
  }

  float getAngle() {
    return this.wAngle;
  }
}
