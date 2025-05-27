import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final DateTime createdAt;
  final String email;
  final String username;
  UserProfile({required this.uid,required this.createdAt, required this.email, required this.username});

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'createdAt': createdAt,
      'email': email,
      'username': username,
    };
  }

}