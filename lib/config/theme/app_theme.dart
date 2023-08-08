import 'package:cinepedia/config/config.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        textTheme: AppTextTheme.montserratTextTheme,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.vulcan,
        appBarTheme: AppBarTheme(
          color: AppColor.vulcan,
          elevation: 0,
        ),
      );
}
