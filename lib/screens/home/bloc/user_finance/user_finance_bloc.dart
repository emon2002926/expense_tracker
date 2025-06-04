import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:expense_repositories/src/repository/user_finance/finance_repo.dart' ;

part 'user_finance_event.dart';
part 'user_finance_state.dart';


class UserFinanceBloc extends Bloc<UserFinanceEvent, UserFinanceState> {
  final GetUserFinance getUserFinance;
  final UpdateUserFinance updateUserFinance;
  final CreateUserFinanceUsecase createUserFinanceUsecase;

  UserFinanceBloc({
    required this.getUserFinance,
    required this.updateUserFinance,
    required this.createUserFinanceUsecase
  }) : super(UserFinanceInitial()) {
    on<LoadUserFinance>(_onLoadUserFinance);
    on<UpdateUserFinanceData>(_onUpdateUserFinanceData);
    on<CreateUserFinance>(_onCreateUserFinance);
  }

  Future<void> _onLoadUserFinance(
      LoadUserFinance event,
      Emitter<UserFinanceState> emit,
      ) async {
    emit(UserFinanceLoading());
    try {
      final finance = await getUserFinance(event.uid);
      emit(UserFinanceLoaded(finance));
    } catch (e) {
      emit(UserFinanceError('Failed to load finance data: $e'));
    }
  }

  Future<void> _onUpdateUserFinanceData(
      UpdateUserFinanceData event,
      Emitter<UserFinanceState> emit,
      ) async {
    emit(UserFinanceUpdating());
    try {
      await updateUserFinance(event.uid,event.finance);
      // Optionally reload after update
      final updatedFinance = await getUserFinance(event.finance.uid);
      emit(UserFinanceLoaded(updatedFinance));
    } catch (e) {
      emit(UserFinanceError('Failed to update finance data: $e'));
    }
  }
  Future<void> _onCreateUserFinance(
      CreateUserFinance event,
      Emitter<UserFinanceState> emit)async{
    try{
      await createUserFinanceUsecase(event.uid,event.finance);
      emit(UserFinanceLoaded(event.finance));
    }catch(e){
      emit(UserFinanceError('Failed to create finance data: $e'));
    }
  }
}