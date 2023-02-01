class SI {
  ArrayList<int[]> total = new ArrayList<int[]>();
  int increaseVal;

  SI(int increaseVal, int initVal) {
    this.increaseVal = increaseVal;
    this.addValue(initVal);
  }

  void addValue(int val) {
    int[] d;
    try {
      d = total.get(0);
    } catch (Exception e) {
      total.add(new int[4]);
      d = total.get(0);
    }

    d[0] = val;
    for (int i = 0; i < 3; i++){
      d[i + 1] += d[i] / 10;
      d[i] %= 10;
    }

    for (int i = 0; i < 4; i++) {
      println(d[i]);
    }
  }
}

SI si = new SI(10, 100);