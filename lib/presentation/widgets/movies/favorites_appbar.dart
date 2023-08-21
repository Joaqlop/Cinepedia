import 'package:cinepedia/config/config.dart';
import 'package:flutter/material.dart';

class FavoritesAppBar extends StatelessWidget {
  const FavoritesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: AppColor.vulcan,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.1,
      title: const Text('Favoritos'),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            Container(
              height: 300,
              width: size.width,
              decoration: BoxDecoration(
                color: AppColor.greyVulcan,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
