import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black.withOpacity(0.9),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.indigo,
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
