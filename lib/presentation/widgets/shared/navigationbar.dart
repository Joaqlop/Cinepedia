import 'package:cinepedia/config/config.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColor.vulcan,
      unselectedItemColor: Colors.white,
      selectedItemColor: AppColor.royalBlue,
      elevation: 0,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Películas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_movies),
          label: 'Series',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outlined),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
