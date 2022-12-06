size(480, 180);
for (int y = 0; y < height; y += 30) {
  for (int x = 0; x < width; x += 30) {
    if((x + y) / 10 % 2 == 0){
      fill(0);
    }else{
      fill(#24c9aa);
    }
    rect(x, y, 30, 30);
  }
}
