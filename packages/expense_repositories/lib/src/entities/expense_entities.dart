import 'package:cloud_firestore/cloud_firestore.dart';

import '../../expense_repository.dart';

class ExpenseEntity {
  String expenseId;
  Category category;
  DateTime dateTime;
  int amount;

  ExpenseEntity({required this.expenseId,required this.category,required this.dateTime,required this.amount});


  Map<String,Object?> toDocument(){
    return {
      'expenseId': expenseId,
      'category': category.toEntity().toDocument(),
      'dateTime': dateTime,
      'amount': amount
    };
  }

  static ExpenseEntity fromDocument(Map<String, dynamic> doc){
    return ExpenseEntity(
        expenseId: doc['expenseId'],
        category: Category.fromEntity(CategoryEntity.fromDocument(doc['category'])),
        dateTime: (doc['dateTime'] as Timestamp).toDate(),
        amount: doc['amount']
    );
  }
}
