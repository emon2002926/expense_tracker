

import '../../auth_repository.dart';

class SignInWithGoogleUseCase{
  final AuthRepository repository;
  SignInWithGoogleUseCase(this.repository);

  Future<UserEntity?> call() {
    return repository.singInWithGoogle();
  }
}