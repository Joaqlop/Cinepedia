import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme get montserratTextTheme => GoogleFonts.montserratTextTheme();

  static TextStyle? get whiteTitleLarge =>
      montserratTextTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontSize: 20,
      );

  static TextStyle? get whiteBodyMedium =>
      montserratTextTheme.bodyMedium?.copyWith(
        color: Colors.white,
        fontSize: 14,
      );

  static TextStyle? get whiteSearchBodyMedium =>
      montserratTextTheme.bodyMedium?.copyWith(
        color: Colors.white,
        fontSize: 16,
      );

  static TextStyle? get greyBodySmall =>
      montserratTextTheme.bodySmall?.copyWith(
        color: Colors.grey,
        fontSize: 13,
      );

  static TextStyle? get colorfulBodySmall =>
      montserratTextTheme.bodySmall?.copyWith(
        fontSize: 13,
      ); // el color se manda por argumento en el copywith()
}
