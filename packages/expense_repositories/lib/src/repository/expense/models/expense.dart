import 'package:expense_repositories/src/repository/expense/expense_repository.dart';

class Expense {
  String expenseId;
  Category category;
  DateTime dateTime;
  int amount;

  Expense({required this.expenseId,required this.category,required this.dateTime,required this.amount});

  static final empty=Expense(expenseId: '', category: Category.empty, dateTime: DateTime.now(), amount: 0);

  ExpenseEntity toEntity(){
    return ExpenseEntity(
        expenseId: expenseId,
        category: category,
        dateTime: dateTime,
        amount: amount);
  }
  static Expense fromEntity(ExpenseEntity entity){
    return Expense(
        expenseId: entity.expenseId,
        category: entity.category,
        dateTime: entity.dateTime,
        amount: entity.amount);
  }
}