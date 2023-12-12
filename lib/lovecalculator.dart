class LoveCalculator {
  static countChars(String firstName, String partnerName) {
    String combineName = firstName.toLowerCase().replaceAll(' ', '') +
        'loves' +
        partnerName.toLowerCase().replaceAll(' ', '');

    int count1 = 0;
    String strCount = '';
    List<String> combinedString = combineName.split('');

    for (String i in combinedString) {
      if (combinedString.indexOf(i) > 1) {
        count1 = 0;
        for (String j in combinedString) {
          if (i == j) {
            count1 = count1 + 1;
          }
        }
        strCount = strCount + count1.toString();
      }
    }

    while (strCount.length > 2) {
      int int1 = int.parse(strCount[0]);
      int int2 = int.parse(strCount[strCount.length - 1]);
      strCount =
          (int1 + int2).toString() + strCount.substring(1, strCount.length - 1);
    }

    return strCount;
  }
}
