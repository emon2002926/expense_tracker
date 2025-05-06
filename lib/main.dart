import 'package:bloc/bloc.dart';
import 'package:expense_repositories/expense_repository.dart';
import 'package:expense_tracker/screens/authentication/login_page/login_screen.dart';
import 'package:expense_tracker/screens/home/bloc/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/screens/home/screen/home_screen.dart';
import 'package:expense_tracker/simple_bloc_observer.dart';
import 'package:expense_tracker/util/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: CustomColors.primary,
            secondary: CustomColors.secondary,
            tertiary: CustomColors.tertiary,
            outline: CustomColors.outline,
          )
      ),
      home: LoginScreen()
    );
  }
}