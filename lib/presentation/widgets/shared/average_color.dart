import 'package:flutter/material.dart';

class AverageColor {
  static averageColor(double voteAverage) {
    Color color = Colors.black;
    if (voteAverage < 8 && voteAverage >= 7) {
      color = Colors.yellow.shade700;
    } else if (voteAverage < 7 && voteAverage >= 6) {
      color = Colors.orange.shade700;
    } else if (voteAverage < 6 && voteAverage > 0) {
      color = Colors.red.shade700;
    } else if (voteAverage == 0) {
      color = Colors.grey.shade800;
    } else {
      color = Colors.green.shade700;
    }

    return color;
  }
}
