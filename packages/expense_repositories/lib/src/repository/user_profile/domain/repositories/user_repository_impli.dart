import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repositories/src/repository/user_profile/data/user_profile.dart';
import 'package:expense_repositories/src/repository/user_profile/domain/repositories/user_repository.dart';

class UserRepositoryImpl  implements UserRepository {
  final  firebaseFirestore = FirebaseFirestore.instance.collection("users");
  @override
  Future<UserProfile> getUser(String uid) async {

    try{
      final doc = await firebaseFirestore.doc(uid).get();
      final userDoc = doc.data() as Map<String,dynamic>;

      return  UserProfile.fromMap(userDoc);
    }catch(e){
      print("🔥 getUser error: $e");
      rethrow;
    }

  }

  @override
  Future<void> updateUser(UserProfile profile) async{
    try{
      await firebaseFirestore.doc(profile.uid).update(profile.toMap());
    }catch(e){
      print("🔥 updateUserProfile error: $e");
      rethrow;
    }
  }
}