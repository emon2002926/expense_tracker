import 'package:expense_repositories/src/repository/expense/expense_repository.dart';
import 'package:expense_tracker/screens/home/bloc/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/screens/home/bloc/user_profile/user_bloc.dart';
import 'package:expense_tracker/screens/home/screen/main_screen.dart';
import 'package:expense_tracker/screens/home/widget/bottom_navigation.dart';
import 'package:expense_tracker/screens/home/widget/custom_floating_Act_Button.dart';
import 'package:expense_tracker/screens/stat_screen/stat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../add_expense/add_expense_screen.dart';
import '../../add_expense/bloc/create_categorybloc/create_category_bloc.dart';
import '../../add_expense/bloc/create_expensebloc/create_expense_bloc.dart';
import '../../add_expense/bloc/get_categorybloc/get_category_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  const HomeScreen({super.key, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  String uid = '';

  void onTabTapped(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
@override
  void initState() {
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {

        if (state is UserLoaded) {
            uid = state.user.uid;
        }
        return Scaffold(
            body: index == 0 ? MainScreen() : const StatScreen(),
            bottomNavigationBar: BottomNavigation(
                currentIndex: index, onTabSelected: onTabTapped),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerDocked,
            floatingActionButton: CustomFloatingActButton(onPressed: () {
              Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) =>
                                CreateCategoryBloc(FirebaseExpenseRepo()),),
                          BlocProvider(
                              create: (context) =>
                              GetCategoryBloc(FirebaseExpenseRepo())
                                ..add(GetCategories(uid))
                          ),
                          BlocProvider(
                              create: (context) =>
                                  CreateExpenseBloc(FirebaseExpenseRepo())
                          ),

                        ],
                        child: AddExpenseScreen(uid: uid),
                      ),
                ),
              ).then((added) {
                if (added == true && context.mounted) {
                  BlocProvider.of<GetExpenseBloc>(context).add(GetExpense(uid));
                }
              });
            },)
        );
      },
    );
  }
}