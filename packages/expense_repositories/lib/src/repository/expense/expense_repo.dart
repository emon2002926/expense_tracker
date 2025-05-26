import 'expense_repository.dart';

abstract class ExpenseRepositories {

  Future<void> createCategory(Category category);
  Future<List<Category>> getCategories();
  Future<void> createExpense(Expense expense,String uid);
  Future<List<Expense>> getExpenses();
}