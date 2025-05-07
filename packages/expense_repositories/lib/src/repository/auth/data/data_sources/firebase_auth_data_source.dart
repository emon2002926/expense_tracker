// data/data_sources/firebase_auth_data_source.dart
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signIn(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return UserModel.fromFirebaseUser(result.user!);
  }

  Future<UserModel?> signUp(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return UserModel.fromFirebaseUser(result.user!);
  }

  Future<void> signOut() async => _firebaseAuth.signOut();

  Stream<UserModel?> get userStream =>
      _firebaseAuth.authStateChanges().map((user) => user != null ? UserModel.fromFirebaseUser(user) : null);
}
