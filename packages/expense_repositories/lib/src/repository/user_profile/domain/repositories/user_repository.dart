import 'package:expense_repositories/src/repository/user_profile/data/user_profile.dart';

abstract class UserRepository {
  Future<UserProfile> getUser(String email);

}