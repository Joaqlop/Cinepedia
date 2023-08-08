import 'dart:ui';

import 'package:flutter/material.dart';

class SlideShowBackground extends StatelessWidget {
  const SlideShowBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.transparent,
              Colors.black.withOpacity(0.9)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: 350,
        width: double.infinity,
        child: Container(color: Colors.indigo.shade700),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(),
      ),
    ]);
  }
}
