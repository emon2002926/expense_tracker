import '../expense_repository.dart';

abstract class ExpenseRepositories {

  Future<void> createCategory(Category category);
  Future<List<Category>> getCategories();
  Future<List<Expense>> getExpenses();
  Future<void> createExpense(Expense expense);

}