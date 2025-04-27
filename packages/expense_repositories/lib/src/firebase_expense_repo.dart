import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repositories/expense_repository.dart';
import 'package:expense_repositories/src/expense_repo.dart';

class FirebaseExpenseRepo implements ExpenseRepositories {
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');
  final categoryCollection = FirebaseFirestore.instance.collection('categories');

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    }catch(e){
      log(e.toString());
      throw e;
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    try {
      return await categoryCollection
          .get()
          .then((value) => value.docs.map((e)=>
          Category.fromEntity(CategoryEntity.fromDocument(e.data())))
          .toList());
          
    }catch(e){
      log(e.toString());
      throw e;
    }
  }
}