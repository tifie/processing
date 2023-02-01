class ArrayVal {
  private boolean isTotalMax = false;
  private ArrayList<int[]> total = new ArrayList<int[]>();
  private ArrayList<int[]> nextExp = new ArrayList<int[]>();
  private IntList increaseVal = new IntList();
  private float magnification = random(1, 1.5);
  private String siPrefix = "";
  private final String[] Prefix = {"", "k", "M", "G", "T", "P",
                                    "E", "Z", "Y", "R", "Q"};

  public ArrayVal() {
    addIncreaseVal(1);
    addTotalVal(10, 0);
  }

  public ArrayVal(int increaseVal, int initVal, int nextExp) {
    addIncreaseVal(increaseVal);
    addTotalVal(initVal, 0);
  }

  void addIncreaseVal(int increaseVal) {
    int n = 0, tmp = increaseVal;
    try {
      n = this.increaseVal.size();
    } catch (Exception e) {
      n = 1;
    }
    for (int i = 0; i < n; i++) {
      int d = 0;
      try {
        d = this.increaseVal.get(i);
      } catch (Exception e) {
        this.increaseVal.append(0);
        d = this.increaseVal.get(i);
      }
      d += tmp;
      tmp = d / 1000;
      this.increaseVal.set(i, d % 1000);
      if (tmp != 0 && i == n - 1) { n++; }
    }
  }

  void addTotalVal() {
    addTotalVal(10, 0);
  }

  private void addTotalVal(int increaseVal, int index) {
    if (isTotalMax) { return; }
    int[] d;
    try {
      d = total.get(index);
    } catch (Exception e) {
      total.add(new int[4]);
      d = total.get(index);
    }
    if (index < this.increaseVal.size()){
      d[0] += this.increaseVal.get(index);
    }
    d[0] += increaseVal;
    for (int i = 0; i < 3; i++) {
      d[i + 1] += d[i] / 10;
      d[i] %= 10;
    }

    int tmp = d[3];
    if (tmp != 0) {
      d[3] = 0;
      if (index == Prefix.length - 1) {
        maxVal();
      }
      addTotalVal(tmp, index + 1);
    }
  }

  void maxVal() {
    int n = total.size();
    for (int i = 0; i < n; i++) {
      int[] d = total.get(i);
      for (int j = 0; j < 3; j++) {
        d[j] = 9;
      }
    }

    isTotalMax = true;
  }

  void valConvertSi() {
    for (int n = total.size() - 1; n >= 0; n--) {
      int i = 0;
      int[] d1 = total.get(n);
      int[] d2 = new int[4];
      try {
        d2 = total.get(n - 1);
      } catch (Exception e) {
        for (int j = 0; j < 4; j++) {
          d2[j] = 0;
        }
      }

      for (int j = 2; j >= 0; j-- ) {
        if (d1[j] == 0) { i++; }
        else { break; }
      }

      if (i < 3) {
        changeStr(i, n);
        break;
      }
    }
  }

  private void changeStr(int i, int n) {
    siPrefix = "";
    int[] d1 = total.get(n);
    int[] d2 = new int[4];
    try {
      d2 = total.get(n - 1);
    } catch (Exception e) {
      for (int j = 0; j < 4; j++) {
        d2[j] = 0;
      }
    }

    switch (i) {
      case 0 :
        siPrefix = "" + d1[2] + d1[1] + d1[0];
      break;
      case 1 :
        siPrefix = "" + d1[1] + d1[0] + "." + d2[2];
      break;
      case 2 :
        siPrefix = "" + d1[0] + "." + d2[2] + d2[1];
      break;
    }
    siPrefix += Prefix[n];
  }

  String getStr() {
    return siPrefix;
  }
}

ArrayVal vals = new ArrayVal(10, 0, 0);
int i = 0;
void setup() {
// println(vals.total.size());
}

void draw() {
  background(0);
  vals.addIncreaseVal(999999999);
  vals.addTotalVal();
  vals.addTotalVal();
  vals.addTotalVal();
  vals.addTotalVal();
  vals.valConvertSi();
  text(vals.getStr(), width/2, height/2);
}
