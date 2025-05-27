import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repositories/src/repository/expense/expense_repository.dart' ;
import 'package:meta/meta.dart';
part 'create_category_event.dart';
part 'create_category_state.dart';
class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final FirebaseExpenseRepo expenseRepositories;
  CreateCategoryBloc(this.expenseRepositories) : super(CreateCategoryInitial()) {
    on<CreateCategoryEvent>((event, emit)async {
      emit(CreateCategoryLoading());
      try{
        await expenseRepositories.createCategory(event.category,event.uid);
        emit(CreateCategorySuccess());
      }catch(e){
        emit(CreateCategoryFailure());
      }
    });
  }
}






