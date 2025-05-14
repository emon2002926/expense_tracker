import 'package:expense_repositories/src/repository/user_profile/data/user.dart';

abstract class UserRepository {
  Future<User> getUser(String email);

}