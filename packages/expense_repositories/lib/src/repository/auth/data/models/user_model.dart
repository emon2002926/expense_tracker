import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String username;

  UserModel({
    required String uid,
    required String email,
    required this.username,
  }) : super(uid: uid, email: email, username: username);

  factory UserModel.fromFirebaseUser(User user, {String username = ''}) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      username: username,
    );
  }

  // Optional: fromFirestore factory
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      email: data['email'] ?? '',
      username: data['username'] ?? '',
    );
  }
}
