part of 'create_expense_bloc.dart';

 class CreateExpenseEvent extends Equatable {

  final Expense expense;
  final String email;

  const CreateExpenseEvent(this.expense,this.email);

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