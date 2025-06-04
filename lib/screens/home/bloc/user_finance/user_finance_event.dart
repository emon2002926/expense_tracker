part of 'user_finance_bloc.dart';

@immutable
sealed class UserFinanceEvent {}

class CreateUserFinance extends UserFinanceEvent {
  final String uid;
  final UserFinanceEntity finance;
  CreateUserFinance(this.uid,this.finance);
}
class LoadUserFinance extends UserFinanceEvent {
  final String uid;
  LoadUserFinance(this.uid);
}

class UpdateUserFinanceData extends UserFinanceEvent {
  final String uid;
  final UserFinanceEntity finance;
  UpdateUserFinanceData(this.uid,this.finance);
}