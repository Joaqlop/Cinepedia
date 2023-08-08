import 'package:cinepedia/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars {
  static movieRating(double voteAverage) {
    final stars = RatingBar.builder(
      ignoreGestures: true,
      allowHalfRating: true,
      direction: Axis.horizontal,
      minRating: 1,
      itemCount: 5,
      initialRating: voteAverage / 2,
      itemSize: 22,
      unratedColor: AppColor.greyVulcan,
      onRatingUpdate: (rating) {},
      itemBuilder: (context, _) => const Icon(
        Icons.star_rate,
        color: Colors.white,
      ),
    );
    return stars;
  }
}
