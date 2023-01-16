int N = 20;

int nextI = 0;
int cnt = 0;
float speed = 0.1f;
int[] ball_color = new int[N];
float[] x = new float[N];
float[] y = new float[N];
float[] vy = new float[N];
boolean start = false;

void setup() {
  size(400, 300);
  colorMode(HSB);
  noStroke();
}

void draw() {
  background(0);
  if(start){
    display();
    for(int i = 0; i < cnt; i++){
      if(y[i] + 10 > height){
        vy[i] = -vy[i];
      }else{
        vy[i] += speed;
      }
      y[i] += vy[i];
    }
  }
}

void display(){
  for(int i = 0; i < cnt; i++){
    fill(ball_color[i], 255, 255);
    ellipse(x[i], y[i], 20, 20);
  }
}

void mousePressed(){
  start = true;
  x[nextI] = mouseX;
  y[nextI] = mouseY;
  vy[nextI] = 0;
  ball_color[nextI] = int(random(0, 255));
  nextI++;
  if(cnt < N)cnt++;
  if(nextI == N){
    nextI = 0;
  }
}
