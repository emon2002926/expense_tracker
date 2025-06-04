import '../../domain/entities/user_finance_entity.dart';
import '../../domain/repositories/user_finance_repository.dart';
import '../data_sources/user_finance_remote_data_source.dart';
import '../models/user_finance_model.dart';

class UserFinanceRepositoryImpl implements UserFinanceRepository {
  final UserFinanceRemoteDataSource remoteDataSource;

  UserFinanceRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserFinanceEntity> getUserFinance(String uid) {
    return remoteDataSource.getUserFinance(uid);
  }

  @override
  Future<void> updateUserFinance(String uid,UserFinanceEntity finance) {
    final model = UserFinanceModel(
      uid: finance.uid,
      totalBalance: finance.totalBalance,
      income: finance.income,
      expense: finance.expense,
    );
    return remoteDataSource.updateUserFinance(uid,model);
  }

  @override
  Future<void> createUserFinance(String uid, UserFinanceEntity finance) {
    final model = UserFinanceModel(
      uid: finance.uid,
      totalBalance: finance.totalBalance,
      income: finance.income,
      expense: finance.expense);
    return remoteDataSource.createUserFinance(uid,model);

  }
}
