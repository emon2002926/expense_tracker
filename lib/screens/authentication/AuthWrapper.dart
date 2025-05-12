import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/screen/home_screen.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';
import 'login_page/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthSuccess) {
          return const HomeScreen();
        } else {
          return  LoginScreen(); // or RegisterScreen
        }
      },
    );
  }
}
