import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_finance_model.dart';

class UserFinanceRemoteDataSource {
  final _financeCollection = FirebaseFirestore.instance.collection("users");

  Future<UserFinanceModel> getUserFinance(String uid) async {
    final doc = await _financeCollection.doc(uid).collection("finance_data").doc(uid).get();
    return UserFinanceModel.fromMap(doc.data()!);
  }

  Future<void> updateUserFinance(String uid,UserFinanceModel model) async {
    await _financeCollection.doc(uid).collection("finance_data")
        .doc(uid).set(model.toMap(),SetOptions(merge: true));

  }

  Future<void> createUserFinance(String uid, UserFinanceModel model) async {
    await _financeCollection.doc(uid).collection("finance_data").doc(uid).set(model.toMap());
  }
}
