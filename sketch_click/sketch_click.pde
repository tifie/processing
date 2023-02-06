String sBall = "ボールを生成";
String sAddCnt = "カウント2倍";

float xSpace = 0;
float splitX = 0;
float wx = 0;
float speed = 0;
int ballsTotal = 0;
boolean isDebug = false;
boolean isSplitlock = false;

ArrayVal vals = new ArrayVal(0, 1, 10, 40);
ArrayList<Period_ball> period = new ArrayList<Period_ball>();

void setup() {
  PFont mono;
  mono = createFont("NotoSerifCJKjp-ExtraLight-48.vlw", 128);
  textFont(mono, 25);
  size(1200, 800);
  splitX = float(width) / 3;
  xSpace = (width - splitX) / 12;
  speed = 0.5;
  wx = splitX / 2;
  frameRate(30);
}

void draw() {
  background(0);
  windowline();

  fill(255);

  for(int i = 0; i < ballsTotal; i++){
    Period_ball ball = period.get(i);
    ball.calc();
    ball.checkSplitLine();
    ball.draw();
  }

  float boxWD = (width - splitX) - 2 * xSpace;
  float txtX = splitX + xSpace + 5;
  fill(128);
  rect(splitX + xSpace, 20, boxWD, 80);
  rect(splitX + xSpace, height * 2 / 3 - 60, boxWD, 40);
  rect(splitX + xSpace, height * 2 / 3, boxWD, 40);
  fill(0);

  String sTotal = vals.getTotalSi();
  float mid = boxWD / 2;
  textSize(80);
  text(sTotal, splitX + xSpace + mid - textWidth(sTotal) / 2, 90);

  textSize(20);
  text(sAddCnt, txtX, height * 2 / 3 - 35);
  text(sBall, txtX, height * 2 / 3 + 25);
  String sBallCost = "コスト:";
  String sAddCntCost = "コスト:" + vals.getCntCostSi();
  if (ballsTotal == 0) {
    sBallCost += 0;
  } else {
    sBallCost += vals.getBallCostSi();
  }
  text(sBallCost,
      splitX + xSpace + boxWD - textWidth(sBallCost) - 5,
      height * 2 / 3 + 25);
  text(sAddCntCost,
      splitX + xSpace + boxWD - textWidth(sAddCntCost) - 5,
      height * 2 / 3 - 35);
}

void windowline() {
  stroke(64);
  strokeWeight(4);
  line(splitX, 0, splitX, height);
  strokeWeight(1);
  stroke(230);
  line(wx, 0, wx, height);
}

boolean isMakeBall() {
  if (isDebug) { return true; }

  if ((ballsTotal < 790  && vals.checkBallCost()) ||
      ballsTotal == 0) {
    return true;
  }

  return false;
}

void makeBall() {
  float shiftWY = 0;
  float shiftAngle = 0;
  if (ballsTotal > 0) {
    Period_ball pball = period.get(ballsTotal - 1);
    shiftWY = pball.getWY() + 12;
    shiftAngle += pball.getAngle() + 10;
  }
  period.add(new Period_ball(shiftWY, shiftAngle));
  if (ballsTotal != 0) { vals.subBallCost(); }
  ballsTotal++;
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX >= splitX - 5 && splitX + 5 >= mouseX) {
      isSplitlock = true;
    }

    if (splitX + xSpace <= mouseX &&
        mouseX <= width - xSpace) {
      if (height * 2 / 3 <= mouseY &&
          mouseY <= height * 2 / 3 + 40 &&
          isMakeBall()) {
        makeBall();
      }

      if (height * 2 / 3 - 60 <= mouseY &&
          mouseY <= height * 2 / 3 - 20) {
          if (isDebug || vals.checkAddCntCost()) {
            vals.subAddCntCost();
          }
      }
    }

  }
}

void mouseDragged() {
  if (isSplitlock) {
    if (mouseX < width/3) {
      splitX = float(width) / 3;
    }else if (mouseX > width * 2 / 3) {
      splitX = float(width) * 2 / 3;
    }else{
      splitX = mouseX;
    }
    wx = splitX / 2;
    xSpace = (width - splitX) / 12;
  }
}

void mouseReleased() {
  isSplitlock = false;
}