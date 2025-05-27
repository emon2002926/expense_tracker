import 'package:expense_repositories/src/repository/expense/expense_repository.dart' ;
import 'package:expense_tracker/screens/authentication/bloc/auth_bloc.dart';
import 'package:expense_tracker/screens/authentication/bloc/auth_state.dart';
import 'package:expense_tracker/screens/authentication/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_tracker/screens/home/widget/genaral_textview.dart';

import '../../home/bloc/get_expense_bloc/get_expense_bloc.dart';
import '../../home/bloc/user_profile/user_bloc.dart';
import '../../home/screen/home_screen.dart';
import '../bloc/auth_event.dart';
import '../registration_page/register_screen.dart';
import 'package:expense_repositories/src/repository/auth/auth_repository.dart' ;
import 'package:expense_repositories/src/repository/user_profile/user_profile_repository.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = FirebaseAuthDataSource();
    final authRepository = AuthRepositoryImpl(dataSource: dataSource);
    final signInUseCase = SignInUseCase(authRepository);
    final signUpUseCase = SignUpUseCase(authRepository);
    return Scaffold(

      backgroundColor: Colors.grey[100],
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {

          if (state is AuthSuccess) {
            print("Uuidhs  :"+state.uid);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>
                  MultiBlocProvider(providers: [
                    BlocProvider(
                      create: (_) =>
                      GetExpenseBloc(FirebaseExpenseRepo())..add(GetExpense(state.uid)),
                    ),
                    BlocProvider(create: (_)=> UserBloc(UserRepositoryImpl())..add(GetUser(state.uid)))

                  ], child: HomeScreen(uid: state.uid,)),
              ),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
      },
      builder: (context, state) {
        return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GeneralTextview(
                      text: "Welcome Back",
                      color: Colors.grey[800],
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    GeneralTextview(
                      text: "Login to continue tracking expenses",
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    const SizedBox(height: 40),

                    // Email Field
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined, size: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_outline, size: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: state is AuthLoading? null : () {
                          // Navigate to Home after login
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();
                          context.read<AuthBloc>().add(SignInRequested(email, password));
                          // context.read<AuthBloc>().add(SignInRequested(emailController.text, passwordController.text));

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Login", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Divider
                    Row(
                      children: const [
                        Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("or"),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Google Button (optional)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Add Google sign-in logic
                        },
                        icon: const FaIcon(FontAwesomeIcons.google, size: 16),
                        label: const Text("Continue with Google"),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Don't have an account? Register Now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to Register Screen
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => BlocProvider(
                                  create: (context) =>AuthBloc(signInUseCase: signInUseCase, signUpUseCase: signUpUseCase)
                                  ,child: RegisterScreen(),)));
                          },
                          child: const Text(
                            "Register Now",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
      },
    ),
    );
  }
}
