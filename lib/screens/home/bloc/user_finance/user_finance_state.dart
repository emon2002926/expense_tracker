part of 'user_finance_bloc.dart';

@immutable
abstract class UserFinanceState {}

class UserFinanceInitial extends UserFinanceState {}

class UserFinanceLoading extends UserFinanceState {}

class UserFinanceLoaded extends UserFinanceState {
  final UserFinanceEntity finance;
  UserFinanceLoaded(this.finance);
}

class UserFinanceError extends UserFinanceState {
  final String message;
  UserFinanceError(this.message);
}

class UserFinanceUpdating extends UserFinanceState {}
