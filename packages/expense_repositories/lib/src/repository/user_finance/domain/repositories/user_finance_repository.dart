import '../entities/user_finance_entity.dart';

abstract class UserFinanceRepository {
  Future<UserFinanceEntity> getUserFinance(String uid);
  Future<void> updateUserFinance(String uid,UserFinanceEntity finance);
  Future<void> createUserFinance(String uid,UserFinanceEntity finance);

}