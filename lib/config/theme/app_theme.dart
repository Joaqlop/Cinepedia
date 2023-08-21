import 'package:cinepedia/config/config.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        textTheme: AppTextTheme.montserratTextTheme,
        scaffoldBackgroundColor: AppColor.vulcan,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          color: AppColor.vulcan,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: AppColor.vulcan,
          selectedItemColor: AppColor.royalBlue,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
        ),
      );
}
