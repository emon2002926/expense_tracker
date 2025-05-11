// domain/usecases/sign_up_usecase.dart
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity?> call(String email, String password,String username) {
    return repository.signUp(email, password,username);
  }
}