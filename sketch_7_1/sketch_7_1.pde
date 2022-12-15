/* 好きな半径に変えられる */
//グローバル変数
int N_POINT = 120; //点の数
final int RADIUS = 200; //半径

void setup() {
  size(500, 500);
}

void draw() {
  translate(width/2, height/2);
  background(0); // 背景: 黒
  strokeWeight(2); //輪郭線の太さ: 2
  stroke(255); //線の色: 白

  //大きな円を描画
  float r = RADIUS; //半径
  draw_circle(r);

  float[][] tri = new float[3][2]; //三角形座標の配列を確保
  float[][] circ = new float[3][2]; //大きな円座標の配列を確保
  //三角形と円の座標を代入
  for(int i = 0; i < 6; i++){
    float t = radians(30 + 60 * i);
    float x = r * cos(t);
    float y = r * sin(t);
    if(i % 2 == 0){// 60度ずつ交互に現れる
      tri[i/2][0] = x;
      tri[i/2][1] = y;
    }else{
      circ[i/2][0] = x;
      circ[i/2][1] = y;
    }
  }

  //大きい三角形と中点線を描画
  float[][] tri2 = new float[3][2];
  for(int i = 0; i < 3; i++){
    float lx = 0, ly = 0;
    // dx, dy　線分の中点座標
    float dx = 0, dy = 0;
    if(i < 2){
      lx = tri[i + 1][0];
      ly = tri[i + 1][1];
      dx = (tri[i][0] + tri[i + 1][0]) / 2;
      dy = (tri[i][1] + tri[i + 1][1]) / 2;
    }else{
      lx = tri[0][0];
      ly = tri[0][1];
      dx = (tri[i][0] + tri[0][0]) / 2;
      dy = (tri[i][1] + tri[0][1]) / 2;
    }
    tri2[i][0] = dx;
    tri2[i][1] = dy;
    line(dx, dy, circ[i][0], circ[i][1]);
    line(tri[i][0], tri[i][1], lx, ly);
  }

  //小さい三角形を描画
  for(int i = 0; i < 3; i++){
    float dx = 0, dy = 0;
    if(i < 2){
      dx = tri2[i + 1][0];
      dy = tri2[i + 1][1];
    }else{
      dx = tri2[0][0];
      dy = tri2[0][1];
    }
    line(tri2[i][0], tri2[i][1], dx, dy);
  }

  //小さな円を描画
  r = (circ[0][1] - tri[0][1]) / 2;
  draw_circle(r);

  fill(0, 0);
  r = circ[0][1] - tri2[0][1];
  for(int i = 0; i < 3; i++){
    // dx, dy　線分の中点座標
    float dx = (circ[i][0] + tri2[i][0]) / 2;
    float dy = (circ[i][1] + tri2[i][1]) / 2;
    ellipse(dx, dy, r, r);
  }
}

//原点からの円を描画
void draw_circle(float r){
  float px = 0, py = 0;
  //円を描画
  for(int i = 0; i <= N_POINT; i++){
    float t = i * TWO_PI / N_POINT;
    float x = r * cos(t);
    float y = r * sin(t);
    if(i > 0){
      line(px, py, x, y);
    }
    px = x;
    py = y;
  }
}
