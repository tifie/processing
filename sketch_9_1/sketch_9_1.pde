int N = 211;// odd cell
boolean[] cell = new boolean[N];
boolean[] pcell = new boolean[N];
int y = 0;
float size = 0;

void setup() {
  size(700, 700);
  background(255);
  stroke(0);
  // [0, ..., 0, 1, 0, ..., 0]
  cell[N / 2] = true;
  pcell[N / 2] = true;
  for(int i = 0; i < N; i++){
    if(cell[i] == true)continue;
    cell[i] = false;
    pcell[i] = false;
  }
  size = 1.0 * width / N;
}

void draw() {
  cell_print();
  cell_new();
  cell_pre();
}

void cell_print() {

  for(int x = 0; x < N; x++){
    if(cell[x]) fill(0);
    else fill(128);
    rect(x * size, y * size, size, size);
  }
  if(height > y * size)y++;
}

void cell_new() {
  boolean l = false, c = false;
  boolean r = false, bool = false;
  for(int i = 0; i < N; i++){
    c = pcell[i];

    if(i == 0)l = pcell[N - 1];
    else l = pcell[i - 1];

    if(i == N - 1)r = pcell[0];
    else r = pcell[i + 1];

    if(l && c && r)bool = false;    //111 -> 0
    if(l && c && !r)bool = false;   //110 -> 0
    if(l && !c && r)bool = false;   //101 -> 0
    if(l && !c && !r)bool = true;   //100 -> 1
    if(!l && c && r)bool = true;    //011 -> 1
    if(!l && c && !r)bool = true;   //010 -> 1
    if(!l && !c && r)bool = true;   //001 -> 1
    if(!l && !c && !r)bool = false; //000 -> 0
    cell[i] = bool;
  }
}

void cell_pre() {
  for(int i = 0; i < N; i++)pcell[i] = cell[i];
}
