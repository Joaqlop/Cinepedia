import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  void onPageTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 20,
      currentIndex: currentIndex,
      onTap: (value) => onPageTap(context, value),
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
