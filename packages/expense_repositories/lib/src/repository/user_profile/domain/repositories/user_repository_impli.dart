import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repositories/src/repository/user_profile/data/user_profile.dart';
import 'package:expense_repositories/src/repository/user_profile/domain/repositories/user_repository.dart';

class UserRepositoryImpl  implements UserRepository {
  final  firebaseFirestore = FirebaseFirestore.instance.collection("users");
  @override
  Future<UserProfile> getUser(String email) async {

    final doc = await firebaseFirestore.doc(email).get();
    final userDoc = doc.data() as Map<String,dynamic>;
    
    return  UserProfile.fromMap(userDoc);

  }
}