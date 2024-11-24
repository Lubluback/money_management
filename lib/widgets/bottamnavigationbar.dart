

import 'package:flutter/material.dart';
import 'package:money_management/views/homepage.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _onItemTapped(int index) {
    setState(() {
      HomePage.selectedindex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomePage.selectedindex,
      builder: (BuildContext ctx, int updatedindex, Widget? _) {
        return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Category',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: updatedindex,
            selectedItemColor: Colors.cyan.shade800,
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 2);
      },
    );
  }
}
