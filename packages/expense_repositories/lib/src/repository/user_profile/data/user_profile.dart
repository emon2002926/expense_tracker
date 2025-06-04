import 'package:cloud_firestore/cloud_firestore.dart';
class UserProfile {
  final String uid;
  final DateTime createdAt;
  final String email;
  final String username;
  final double? totalBalance;
  final double? income;
  final double? expense;

  UserProfile({required this.uid,required this.createdAt
    , required this.email, required this.username,this.totalBalance,this.income,this.expense});

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      email: map['email'] as String,
      username: map['username'] as String,
      totalBalance: map['totalBalance'] as double?,
      income: map['income'] as double?,
      expense: map['expense'] as double?,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'createdAt': createdAt,
      'email': email,
      'username': username,
      'totalBalance': totalBalance,
      'income': income,
      'expense': expense,
    };
  }

}