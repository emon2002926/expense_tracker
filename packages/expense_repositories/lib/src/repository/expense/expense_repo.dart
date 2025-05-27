import 'expense_repository.dart';

abstract class ExpenseRepositories {

  Future<void> createCategory(Category category,String uid);
  Future<List<Category>> getCategories(String uid);
  Future<void> createExpense(Expense expense,String uid);
  Future<List<Expense>> getExpenses(String uid);
}