import 'package:expense_tracker/screens/home/views/home_screen.dart';
import 'package:expense_tracker/util/app_colors.dart';
import 'package:flutter/material.dart';
class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: CustomColors.primary,
          secondary: CustomColors.secondary,
          tertiary: CustomColors.tertiary,
          outline: CustomColors.outline
        )
      ),
      home: HomeScreen(),
    );
  }
}
