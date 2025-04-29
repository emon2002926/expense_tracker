import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repositories/expense_repository.dart';
import 'package:meta/meta.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {

  FirebaseExpenseRepo firebaseExpenseRepo;
  GetCategoryBloc(this.firebaseExpenseRepo) : super(GetCategoryInitial()) {
    on<GetCategoryEvent>((event, emit) async {
      try{
        List<Category> categories = await firebaseExpenseRepo.getCategories();
        emit(GetCategorySuccess(categories));
      }catch(e){
        emit (GetCategoryFailure());
      }
    });
  }
}
