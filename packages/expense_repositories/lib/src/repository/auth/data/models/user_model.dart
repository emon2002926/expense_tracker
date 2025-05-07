
// data/models/user_model.dart
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(uid: user.uid, email: user.email ?? '');
  }
}