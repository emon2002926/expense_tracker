import 'package:expense_tracker/screens/home/bloc/user_finance/user_finance_bloc.dart';
import 'package:expense_tracker/screens/home/bloc/user_profile/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/screens/home/bloc/get_expense_bloc/get_expense_bloc.dart';
import 'package:expense_tracker/screens/authentication/bloc/auth_bloc.dart';
import 'package:expense_tracker/screens/authentication/bloc/auth_event.dart';
import 'package:expense_tracker/screens/authentication/bloc/auth_state.dart';
import 'package:expense_tracker/screens/authentication/login_page/login_screen.dart';
import 'package:expense_tracker/screens/home/screen/home_screen.dart';
import 'package:expense_repositories/src/repository/expense/expense_repository.dart';
import 'package:expense_repositories/src/repository/auth/auth_repository.dart';
import 'package:expense_repositories/src/repository/user_profile/user_profile_repository.dart';
import 'package:expense_repositories/src/repository/user_finance/finance_repo.dart' ;


import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    // Trigger the AppStarted event after 10 seconds delay
    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthBloc>().add(AppStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataSource = FirebaseAuthDataSource();
    final authRepository = AuthRepositoryImpl(dataSource: dataSource);
    final signInUseCase = SignInUseCase(authRepository);
    final signUpUseCase = SignUpUseCase(authRepository);
    final googleSignInUseCase = SignInWithGoogleUseCase(authRepository);

    final financeDataSource = UserFinanceRepositoryImpl(UserFinanceRemoteDataSource());
    final getUserFinance = GetUserFinance(financeDataSource);
    final updateUserFinance = UpdateUserFinance(financeDataSource);
    final createUserFinanceUsecase = CreateUserFinanceUsecase(financeDataSource);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {

          // If user is authenticated, navigate to Home Screen
          print("Uuidhs  :"+state.email!);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => MultiBlocProvider(providers: [
                BlocProvider(
                  create: (_) =>
                  GetExpenseBloc(FirebaseExpenseRepo())..add(GetExpense(state.uid)),
                ),
                BlocProvider(create: (_)=> UserBloc(UserRepositoryImpl())..add(GetUser(state.uid))),
                BlocProvider(create: (_) => UserFinanceBloc(getUserFinance: getUserFinance,
                    updateUserFinance: updateUserFinance, createUserFinanceUsecase: createUserFinanceUsecase))

                // BlocProvider(create: (_)=> UserFinanceBloc(getUserFinance: getUserFinance, updateUserFinance: updateUserFinance)..add(LoadUserFinance(state.uid)))

              ],
                  child: HomeScreen(uid: state.uid,)),

            ),
          );
        } else if (state is AuthFailure || state is AuthInitial) {
          // If user is not authenticated, navigate to Login Screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) =>
                AuthBloc(signInUseCase: signInUseCase
                    ,signUpUseCase: signUpUseCase, signInWithGoogleUseCase: googleSignInUseCase)
                  ..add(AppStarted()),
                child:  LoginScreen(),
              ),
            ),
          );
        }
        // Keep splash screen visible while auth loading state is active
      },
      child:  Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Lottie.asset(
            'assets/animations/wallet.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
