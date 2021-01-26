import 'dart:collection';
import 'dart:math';

import 'package:scidart/numdart.dart';

main() {
  var rng = new Random();

  var randomArray1 = randomArray(1000);
  var tmp = randomArray1.map((element) => element * 20 + 100).toList();
  randomArray1.replaceRange(0, randomArray1.length, tmp);

  var randomArray2 = randomArray(1000);
  var tmp2 = randomArray1
      .map((element) => element + (10 * rng.nextDouble() + 50))
      .toList();
  randomArray2.replaceRange(0, randomArray2.length, tmp2);

  print(calculateCovariance(randomArray1, randomArray2));
  print(pearsonCorrelation(randomArray1, randomArray2));
  print(spearmanCorrelation(randomArray1, randomArray2));
}

calculateCovariance(Array x, Array y) {
  var sumOfX =
      x.reduce((previousValue, element) => previousValue + (element - mean(x)));
  var sumOfY =
      y.reduce((previousValue, element) => previousValue + (element - mean(y)));
  var covariance = (sumOfX * sumOfY * 1 / (x.length - 1));

  return covariance;
}

spearmanCorrelation(Array x, Array y) {
  var sortedX = x;
  sortedX.sort();

  var sortedY = y;
  sortedY.sort();

  HashMap<double, int> rankMapX = new HashMap();
  HashMap<double, int> rankMapY = new HashMap();

  for (int i = 0; i < sortedX.length; i++) {
    rankMapX[sortedX[i]] = i + 1;
  }

  for (int i = 0; i < sortedY.length; i++) {
    rankMapY[sortedY[i]] = i + 1;
  }

  var rankArrayX = Array(List(x.length));
  var rankArrayY = Array(List(y.length));

  for (int i = 0; i < x.length; i++) {
    rankArrayX[i] = rankMapX[x[i]].toDouble();
  }

  for (int i = 0; i < y.length; i++) {
    rankArrayY[i] = rankMapY[y[i]].toDouble();
  }

  var rankCovariance = calculateCovariance(rankArrayY, rankArrayY);
  var spearManCorrelation = rankCovariance / (standardDeviation(rankArrayX));

  return spearManCorrelation;
}

pearsonCorrelation(Array x, Array y) {
  var covariance = calculateCovariance(x, y);
  var stdv = standardDeviation(x) * standardDeviation(y);

  return covariance / stdv;
}
