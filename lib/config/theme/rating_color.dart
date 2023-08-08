import 'package:flutter/material.dart';

class RatingColor {
  static averageColor(double voteAverage) {
    Color color = Colors.black;
    if (voteAverage <= 8 && voteAverage >= 6.5) {
      color = Colors.yellow.shade700;
    } else if (voteAverage < 6.5 && voteAverage >= 5.5) {
      color = Colors.orange.shade700;
    } else if (voteAverage < 5.5 && voteAverage > 0) {
      color = Colors.red.shade700;
    } else if (voteAverage == 0) {
      color = Colors.grey.shade800;
    } else {
      color = Colors.green.shade700;
    }

    return color;
  }
}
