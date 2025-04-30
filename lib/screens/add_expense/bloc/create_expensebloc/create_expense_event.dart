part of 'create_expense_bloc.dart';

 class CreateExpenseEvent extends Equatable {

  final Expense expense;
  const CreateExpenseEvent(this.expense);

  @override
  List<Object> get props => [expense];
}
//
// class CreateExpense extends CreateExpenseEvent {
//   final Expense expense;
//
//   const CreateExpense({required this.expense});
//
//   @override
//   List<Object> get props => [expense];
// }