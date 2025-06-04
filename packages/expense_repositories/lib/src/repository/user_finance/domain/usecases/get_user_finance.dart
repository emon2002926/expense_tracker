import '../entities/user_finance_entity.dart';
import '../repositories/user_finance_repository.dart';

class GetUserFinance {
  final UserFinanceRepository repository;

  GetUserFinance(this.repository);

  Future<UserFinanceEntity> call(String uid) {
    return repository.getUserFinance(uid);
  }
}