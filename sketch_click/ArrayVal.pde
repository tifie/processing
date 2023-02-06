class ArrayVal {
  private boolean isTotalMax = false;
  private boolean isAddCntCostMax = false;
  private boolean isBallCostMax = false;
  private ArrayList<int[]> total = new ArrayList<int[]>();
  private ArrayList<int[]> addCntCost = new ArrayList<int[]>();
  private ArrayList<int[]> ballcost = new ArrayList<int[]>();
  private ArrayList<int[]> addCnt = new ArrayList<int[]>();
  private float addCntCostRate = random(30, 45);
  private float ballCostRate = random(1, 3);
  private String totalSiPrefix  = "";
  private String addCntCostSiPrefix = "";
  private String ballCostSiPrefix = "";
  private final String[] Prefix = {"", "A", "B", "C", "D",
                                  "E", "F", "G", "H", "I",
                                  "J", "K", "L", "N", "M",
                                  "O", "P", "Q", "R", "S",
                                  "T", "U", "V", "W", "X",
                                  "Y", "Z"};

  ArrayVal(int initTotal, int addCnt, int initBallCost, int initCntCost) {
    addTotal(initTotal);
    increaseCnt(addCnt);
    addCost(ballcost, initBallCost);
    addCost(addCntCost, initCntCost);
  }

  void addTotal() {
    addTotal(0);
  }

  void addTotal(int addVal) {
    if (isTotalMax) { return; }
    addTotal(addVal, 0);
  }

  private void addTotal(int addVal, int index) {
    int[] list = new int[4];
    try {
      list = total.get(index);
    } catch (Exception e) {
      total.add(new int[4]);
      list = total.get(index);
    }

    if (index < this.addCnt.size()) {
      int addCnt = this.addCnt.get(index)[0];
      list[0] += addCnt;
    }
    list[0] += addVal;
    for (int i = 0; i < 3; i++) {
      list[i + 1] += list[i] / 10;
      list[i] %= 10;
    }

    int tmp = list[3];
    if (tmp > 0 || index < this.addCnt.size() - 1) {
      list[3] = 0;
      if (index == Prefix.length - 1) {
        maxAryList(total);
        return;
      }
      addTotal(tmp, index + 1);
    }
  }

  void subBallCost() {
    if (!isDebug || checkBallCost()) { subTotal(ballcost); }
    nextCost(ballcost, ballCostRate);
  }

  void subAddCntCost() {
    if (!isDebug || checkAddCntCost()) { subTotal(addCntCost); }
    increaseCnt();
    nextCost(addCntCost, addCntCostRate);
  }

  void subTotal(ArrayList<int[]> aryListCost) {
    int[] totalList = new int[4];
    int[] costList = new int[4];
    int tmp = 0;
    for (int n = aryListCost.size() - 1; n >= 0; n--) {
      int i = 0;
      totalList = total.get(n);
      costList = aryListCost.get(n);
      for (i = 0; i < 3; i++) {
        totalList[i] -= costList[i] + tmp;
        if (totalList[i] < 0) {
          totalList[i + 1] -= 1;
          totalList[i] += 10;
        }
      }
      tmp = totalList[3];
      totalList[3] = 0;
    }
  }

  boolean checkAddCntCost() {
    return checkCost(addCntCost);
  }

  boolean checkBallCost() {
    return checkCost(ballcost);
  }

  private boolean checkCost(ArrayList<int[]> aryListCost) {
    int totalN = total.size();
    int costN = aryListCost.size();
    if (totalN > costN) {
      return true;
    }
    int[] totalList = new int[4];
    int[] costList = new int[4];
    for (int i = costN - 1; i >= 0; i--) {
      totalList = total.get(i);
      costList = aryListCost.get(i);
      for (int j = 2; j >= 0; j--) {
        if (totalList[j] > costList[j]) {
          return true;
        } else if (totalList[j] == costList[j]) {
          continue;
        } else { return false; }
      }
    }

    return true;
  }

  void increaseCnt() {
    increaseCnt(0);
  }

  void increaseCnt(int addVal) {
    if (isTotalMax) { return; }
    int[] list = new int[1];
    int n = addCnt.size();
    int increaseVal = addVal;

    if (n == 0) { n = 1; }
    for (int i = 0; i < n; i++) {
      try {
        list = addCnt.get(i);
      } catch (Exception e) {
        addCnt.add(new int[1]);
        list = addCnt.get(i);
      }

      list[0] += increaseVal + list[0];
      increaseVal = list[0] / 1000;
      list[0] %= 1000;
      if (increaseVal > 0 && i == n - 1) { n++; }
    }
  }

  void addCost(ArrayList<int[]> aryListCost, int addcost) {
    if (isBallCostMax) { return; }
    if (isAddCntCostMax) { return; }
    int[] list = new int[4];
    int tmp = addcost;
    if (aryListCost.size() == 0) {
      aryListCost.add(new int[4]);
    }
    for (int i = 0; i < aryListCost.size(); i++) {
      list = aryListCost.get(i);
      list[0] += tmp;
      for (int j = 0; j < 3; j++) {
        list[j + 1] += list[j] / 10;
        list[j] %= 10;
      }
      tmp = list[3];
      list[3] = 0;
      if (tmp > 0 && i == aryListCost.size() - 1) {
        if (i == Prefix.length - 1) {
          maxAryList(aryListCost);
          return;
        }
        aryListCost.add(new int[4]);
      }
    }
  }

  private void nextCost(ArrayList<int[]> aryListCost, float costRate) {
    if (isBallCostMax) { return; }
    ArrayList<int[]> tmpAryL = new ArrayList<int[]>();
    int[] list1 = new int[4];
    int[] tmpL = new int[4];
    int costRateInterger = int(costRate) / 10;
    int costRateDecimal = int(costRate) % 10;
    for (int i = 0; i < aryListCost.size(); i++) {
      tmpAryL.add(new int[4]);
      list1 = aryListCost.get(i);
      tmpL = tmpAryL.get(i);
      for (int j = 0; j < 3; j++) {
        tmpL[j] = list1[j];
        list1[j] += list1[j] * costRateInterger;
      }
    }
    for (int i = tmpAryL.size() - 1; i >= 0; i--) {
      int[] list2 = new int[4];
      list1 = aryListCost.get(i);
      tmpL = tmpAryL.get(i);
      try {
        list2 = aryListCost.get(i - 1);
      } catch (Exception e) {
        for (int j = 0; j < 4; j++) {
          list2[j] = 0;
        }
      }
      for (int j = 2; j > 0; j--) {
        list1[j - 1] += tmpL[j] * costRateDecimal;
      }
      list2[2] += tmpL[0] * costRateDecimal;
    }
    addCost(aryListCost, 0);
    if (aryListCost == ballcost) {
      ballCostRate = random(1, 3);
    }
    if (aryListCost == addCntCost) {
      addCntCostRate = random(30, 45);
    }
  }

  void maxAryList(ArrayList<int[]> aryList) {
    if (aryList == total) { isTotalMax = true; }
    if (aryList == ballcost) { isBallCostMax = true; }
    if (aryList == addCntCost) {isAddCntCostMax = true;}
    int n = aryList.size();
    for (int i = 0; i < n; i++) {
      int[] d = aryList.get(i);
      for (int j = 0; j < 3; j++) {
        d[j] = 9;
      }
    }
    if (aryList == total) {
      totalSiPrefix = convertSi(aryList);
    }
    if (aryList == ballcost) {
      ballCostSiPrefix = convertSi(aryList);
    }
    if (aryList == addCntCost) {
      addCntCostSiPrefix = convertSi(aryList);
    }
  }

  private String convertSi(ArrayList<int[]> aryList) {
    String siPrefix = "";
    for (int n = aryList.size() - 1; n >= 0; n--) {
      int i = 0;
      int[] list1 = aryList.get(n);
      int[] list2 = new int[4];
      try {
        list2 = aryList.get(n - 1);
      } catch (Exception e) {
        for (int j = 0; j < 4; j++) {
          list2[j] = 0;
        }
      }

      for (int j = 2; j >= 0; j--) {
        if (list1[j] == 0) { i++; }
        else { break; }
      }
      if (n == 0 && i == 3) { i--; }

      if (i < 3) {
        switch (i) {
          case 0 :
            siPrefix = "" + list1[2] + list1[1] + list1[0];
          break;
          case 1 :
            siPrefix = "" + list1[1] + list1[0] + "." + list2[2];
          break;
          case 2 :
            siPrefix = "" + list1[0] + "." + list2[2] + list2[1];
          break;
        }
        siPrefix += Prefix[n];
        break;
      }
    }
    return siPrefix;
  }

  public String getTotalSi() {
    if (!isTotalMax) {
      totalSiPrefix = convertSi(total);
    }
    return totalSiPrefix;
  }

  public String getBallCostSi() {
    if (!isBallCostMax) {
      ballCostSiPrefix = convertSi(ballcost);
    }
    return ballCostSiPrefix;
  }

  public String getCntCostSi() {
    if (!isAddCntCostMax) {
      addCntCostSiPrefix = convertSi(addCntCost);
    }
    return addCntCostSiPrefix;
  }
}