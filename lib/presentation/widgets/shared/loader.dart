import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 200,
        width: 300,
        child: FlareActor(
          'assets/animations/loading_circle.flr',
          animation: 'load',
          snapToEnd: true,
        ),
      ),
    );
  }
}
