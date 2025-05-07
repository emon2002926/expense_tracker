import '../../data/data_sources/firebase_auth_data_source.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<UserEntity?> signIn(String email, String password) => dataSource.signIn(email, password);

  @override
  Future<UserEntity?> signUp(String email, String password) => dataSource.signUp(email, password);

  @override
  Future<void> signOut() => dataSource.signOut();

  @override
  Stream<UserEntity?> get userStream => dataSource.userStream;
}