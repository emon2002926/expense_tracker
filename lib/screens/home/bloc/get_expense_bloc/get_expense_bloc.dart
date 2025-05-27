import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repositories/src/repository/expense/expense_repository.dart' ;
import 'package:meta/meta.dart';

part 'get_expense_event.dart';
part 'get_expense_state.dart';

class GetExpenseBloc extends Bloc<GetExpenseEvent, GetExpenseState> {

  final FirebaseExpenseRepo _expenseRepositories;
  GetExpenseBloc(this._expenseRepositories) : super(GetExpenseInitial()) {
    on<GetExpenseEvent>((event, emit) async {
      emit(GetExpenseLoading());
      try{
        List<Expense> expenses = await _expenseRepositories.getExpenses(event.uid);
        emit(GetExpenseSuccess(expenses: expenses));

      }catch(e){
        emit(GetExpenseFailure());
      }
    });
  }
}
