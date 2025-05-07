// domain/usecases/sign_in_usecase.dart
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signIn(email, password);
  }
}