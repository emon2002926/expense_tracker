import 'dart:math';

import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:expense_tracker/screens/home/widget/bottom_navigation.dart';
import 'package:expense_tracker/screens/stat_screen/stat_screen.dart';
import 'package:expense_tracker/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  void onTabTapped(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? const MainScreen() : const StatScreen(),
      bottomNavigationBar: BottomNavigation(currentIndex: index, onTabSelected: onTabTapped),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }
}