import 'dart:collection';
import 'package:scidart/numdart.dart';

///
/// This class is the entry point for statistical analysis.
/// Currently it offers functions to describe the correlation between two data sets of equal size.
///
class StatisticsAnalyzer {
  StatisticsAnalyzer();

  ///
  /// Calculates and returns the covariance between two Arrays of numbers
  ///
  /// returns null if the arrays do not have the same length
  ///
  /// The datasets are assumed to have a linear relationship and Gauss distribution
  double calculateCovariance(Array x, Array y) {
    if (x.length != y.length) return null;

    var sumOfX = x.reduce(
        (previousValue, element) => previousValue + (element - mean(x)));
    var sumOfY = y.reduce(
        (previousValue, element) => previousValue + (element - mean(y)));
    var covariance = (sumOfX * sumOfY * 1 / (x.length - 1));

    return covariance;
  }

  ///
  /// Calculates and returns the Spearman correlation between two Arrays of numbers
  ///
  /// returns null if the arrays do not have the same length
  ///
  /// The two supplied datasets do not have to be linear or Gauss distributed
  ///
  double spearmanCorrelation(Array x, Array y) {
    if (x.length != y.length) return null;

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
    var spearManCorrelation = rankCovariance /
        (standardDeviation(rankArrayX) * standardDeviation(rankArrayY));

    return spearManCorrelation;
  }

  ///
  /// Calculates and returns the Pearson correlation coefficient between the supplied datasets
  ///
  /// returns null if the arrays do not have the same length
  ///
  /// The datasets are assumed to be linear related and Gauss distributed
  ///
  double pearsonCorrelation(Array x, Array y) {
    if (x.length != y.length) return null;

    var covariance = calculateCovariance(x, y);
    var stdv = standardDeviation(x) * standardDeviation(y);

    return covariance / stdv;
  }
}
