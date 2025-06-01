// data/data_sources/firebase_auth_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel?> singInWithGoogle() async {
    try{
      final googleUser = await _googleSignIn.signIn();
      if(googleUser == null)return null;
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
      final result = await _firebaseAuth.signInWithCredential(credential);
      final user = result.user!;
      final uid = user.uid;
      final userDoc = await FirebaseFirestore.instance
          .collection("users").doc(uid).get();

      if (!userDoc.exists) {
        // Add to Firestore if new
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          'uid': uid,
          'email': user.email,
          'username': user.displayName ?? '',
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return UserModel.fromFirebaseUser(user);
    }catch(e){
      print("Google Sign-In error: $e");
      return null;
    }
  }

  Future<UserModel?> signIn(String email, String password) async {
    try{
      final result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final uid = result.user!.uid;
      final userDoc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
      if(userDoc.exists){
        return UserModel.fromFirestore(userDoc);
      }else{
        return null;
      }

    }catch(e){
      print('SignIn error: $e');
      return null;
    }
  }

  Future<UserModel?> signUp(String email, String password, String username) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = result.user!.uid;
      // Save extra data to Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
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

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Stream<UserModel?> get userStream =>
      _firebaseAuth.authStateChanges().map((user) => user != null ? UserModel.fromFirebaseUser(user) : null);
}
