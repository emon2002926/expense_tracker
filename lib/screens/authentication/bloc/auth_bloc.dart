import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_repositories/src/repository/auth/domain/usecases/sign_up_usecase.dart';
import 'package:expense_repositories/src/repository/auth/domain/usecases/sign_in_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc({required this.signInUseCase, required this.signUpUseCase}) : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signInUseCase(event.email, event.password);
        emit(AuthSuccess(user!.uid));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signUpUseCase(event.email, event.password);
        emit(AuthSuccess(user!.uid));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthInitial());
    });
  }
}
