abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String username;

  SignUpRequested(this.email, this.password, this.username);
}

class SignOutRequested extends AuthEvent {}
