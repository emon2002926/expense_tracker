part of 'get_expense_bloc.dart';

@immutable
sealed class GetExpenseEvent extends Equatable{
  final String uid;
  const GetExpenseEvent(this.uid);

  @override
  List<Object?> get props => [];
}
class GetExpense extends GetExpenseEvent {
  const GetExpense(super.uid);
}


