import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repositories/src/repository/expense/expense_repository.dart' ;
import 'package:meta/meta.dart';

part 'create_expense_event.dart';
part 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  FirebaseExpenseRepo firebaseExpenseRepo;
  CreateExpenseBloc(this.firebaseExpenseRepo) : super(CreateExpenseInitial()) {
    on<CreateExpenseEvent>((event, emit) async{
      emit(CreateExpenseLoading());
      try{
        await firebaseExpenseRepo.createExpense(event.expense,event.email);
        emit(CreateExpenseSuccess());
      }catch(e){
        emit(CreateExpenseFailure());
      }

    });
  }
}


