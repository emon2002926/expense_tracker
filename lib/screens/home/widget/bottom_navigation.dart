import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const BottomNavigation({super.key, required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: currentIndex==0?Colors.blue:Colors.green,
        unselectedItemColor: Colors.grey,
        elevation: 3,
        currentIndex: currentIndex,
        onTap: onTabSelected, // Call the function to change the screen
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.graph_square_fill),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
