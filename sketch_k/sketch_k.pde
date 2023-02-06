final int FIELD_WD = 8;
final int FIELD_HT = 12;
final int xSpace = 50;
final int ySpace = 50;
// int FallingSpeed = 0.9;
int[][] field = new int[FIELD_WD][FIELD_HT];
float[][] pos = new float[2][2];
int[] subAnglePosX = {1, -1, -1, 1};
int[] subAnglePosY = {1, 1, -1, -1};
int puyoangle = 0;
float puyoSize = 30;
boolean isMouseLock = false;

void puyoinit(){
  pos[0][0] = xSpace + puyoSize * 2;
  pos[0][1] = ySpace
}

void setup() {
  size(600, 500);
}

void draw() {
  background(0);
  stroke(0);
  for(int y = 0; y < FIELD_HT; y++){
    for(int x = 0; x < FIELD_WD; x++){
      fill(128);
      rect(xSpace + puyoSize / 2 + puyoSize*x, ySpace + puyoSize * y, puyoSize, puyoSize);
    }
  }
  noStroke();
  fill(255);
  ellipse(pos[0][0], pos[0][1], puyoSize, puyoSize);
  ellipse(pos[1][0], pos[1][1], puyoSize, puyoSize);
  if (xSpace + puyoSize * FIELD_HT > pos[0][1] + puyoSize / 2 &&
      ySpace + puyoSize * FIELD_HT > pos[1][1] + puyoSize / 2){
    pos[0][1] += 0.1;
    pos[1][1] += 0.1;
  }else{

  }
}

void mousePressed(){
  if(!isMouseLock){
    isMouseLock = true;
    println(puyoangle);
    if(mouseButton == LEFT){
      pos[0][0] += puyoSize * subAnglePosX[puyoangle];
      pos[0][1] += puyoSize * subAnglePosY[puyoangle];
      puyoangle = (puyoangle + 1) % 4;
    }
    if(mouseButton == RIGHT){
      pos[0][0] += puyoSize * subAnglePosX[(puyoangle + 1) % 4];
      pos[0][1] += puyoSize * subAnglePosY[(puyoangle + 1) % 4];
      puyoangle--;
      if(puyoangle == -1)puyoangle = 3;
    }
    isMouseLock = false;
  }
}

void keyPressed(){
  println(keyCode);
}

// void chenge_pos(float angle){
//   switch (angle) {
//     case 0 :
//       pos[0][0] += puyoSize;
//       break;
//     case 1 :

//     break;
//   }
// }