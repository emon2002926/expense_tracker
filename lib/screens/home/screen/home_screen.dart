import 'dart:math';

import 'package:expense_repositories/expense_repository.dart';
import 'package:expense_tracker/screens/home/screen/main_screen.dart';
import 'package:expense_tracker/screens/home/widget/bottom_navigation.dart';
import 'package:expense_tracker/screens/home/widget/custom_floating_Act_Button.dart';
import 'package:expense_tracker/screens/stat_screen/stat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_expense/add_expense_screen.dart';
import '../../add_expense/bloc/create_categorybloc/create_category_bloc.dart';
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
      floatingActionButton: CustomFloatingActButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => CreateCategoryBloc(FirebaseExpenseRepo()),
              child: AddExpenseScreen(),
            ),
          ),
        );
      },)
    );
  }
}