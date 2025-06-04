import '../entities/user_finance_entity.dart';
import '../repositories/user_finance_repository.dart';

class UpdateUserFinance {
  final UserFinanceRepository repository;

  UpdateUserFinance(this.repository);

  Future<void> call(String uid,UserFinanceEntity finance) {
    return repository.updateUserFinance(uid,finance);
  }
}