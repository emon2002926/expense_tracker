abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String uid;
  final String? email;
  AuthSuccess( this.uid,this.email);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
