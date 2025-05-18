import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final DateTime createdAt;
  final String email;
  final String username;
  UserProfile({required this.createdAt, required this.email, required this.username});

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
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