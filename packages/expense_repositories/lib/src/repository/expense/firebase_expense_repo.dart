import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repositories/src/repository/expense/expense_repository.dart';
import 'package:expense_repositories/src/repository/expense/expense_repo.dart';

class FirebaseExpenseRepo implements ExpenseRepositories {

  final expenseCollection = FirebaseFirestore.instance.collection('expenses');
  final newExpenseCollection = FirebaseFirestore.instance.collection('users');
  final categoryCollection = FirebaseFirestore.instance.collection('categories');

  @override
  Future<void> createCategory(Category category,String uid) async {
    try {

      final newCategoryCollection = FirebaseFirestore.instance.collection("users").doc(uid)
          .collection('categories');
      await newCategoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategories(String uid) async {
    try {
      final newCategoryCollection = FirebaseFirestore.instance.collection("users").doc(uid)
          .collection('categories');
      return await newCategoryCollection
          .get()
          .then((value) => value.docs.map((e)=>
          Category.fromEntity(CategoryEntity.fromDocument(e.data())))
          .toList());
          
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createExpense(Expense expense,String uid) async{
    try {
      final newExpenseCollection = FirebaseFirestore.instance.collection('users').doc(uid)
          .collection('expenses');

      return await newExpenseCollection.doc(expense.expenseId).set(expense.toEntity().toDocument());
      // await expenseCollection.doc(expense.expenseId).set(expense.toEntity().toDocument());
    }catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpenses(String uid) async {
    try {
      final newExpenseCollection = FirebaseFirestore.instance.collection('users').doc(uid)
          .collection('expenses');
      return await newExpenseCollection
          .get()
          .then((value) => value.docs.map((e)=>
          Expense.fromEntity(ExpenseEntity.fromDocument(e.data())))
          .toList());

    }catch(e){
      log(e.toString());
      rethrow;
    }

  }

}