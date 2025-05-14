// data/data_sources/firebase_auth_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signIn(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    final uid = result.user!.uid;
    final userDoc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return UserModel.fromFirestore(userDoc);
  }

  Future<UserModel?> signUp(String email, String password, String username) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // final uid = result.user!.uid;

      // Save extra data to Firestore
      await FirebaseFirestore.instance.collection('users').doc(email).set({
        'email': email,
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return UserModel.fromFirebaseUser(result.user!);
    } catch (e) {
      print('Signup error: $e');
      return null;
    }
  }

  Future<void> signOut() async => _firebaseAuth.signOut();

  Stream<UserModel?> get userStream =>
      _firebaseAuth.authStateChanges().map((user) => user != null ? UserModel.fromFirebaseUser(user) : null);
}
