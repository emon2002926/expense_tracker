import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final DateTime createdAt;
  final String email;
  final String username;
  User({required this.createdAt, required this.email, required this.username});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'email': email,
      'username': username,
    };
  }

}