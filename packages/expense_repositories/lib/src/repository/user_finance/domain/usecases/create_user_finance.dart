
import '../../finance_repo.dart';

class CreateUserFinanceUsecase {
  final UserFinanceRepository repository;
  CreateUserFinanceUsecase(this.repository);

  Future<void> call(String uid,UserFinanceEntity finance){
    return repository.createUserFinance(uid, finance);
  }

}