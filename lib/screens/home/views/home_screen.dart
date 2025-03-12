import 'dart:math';

import 'package:expense_tracker/screens/home/views/main_screen.dart';
import 'package:expense_tracker/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.graph_square_fill),
                  label: 'Home'
              )
            ]
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        shape: const CircleBorder(),
        child: Container(
          height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors:[
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary

                ,Theme.of(context).colorScheme.primary
              ],
                  transform: GradientRotation(pi / 4)
              ),

            ),
            child: Icon(CupertinoIcons.add)),
      ),
      body: MainScreen(),
    );
  }
}
