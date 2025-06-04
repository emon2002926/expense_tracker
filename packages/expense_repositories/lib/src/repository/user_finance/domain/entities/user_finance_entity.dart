
class UserFinanceEntity {
  final String uid;
  final double totalBalance;
  final double income;
  final double expense;

  UserFinanceEntity({
    required this.uid,
    required this.totalBalance,
    required this.income,
    required this.expense,
  });

  /// Factory constructor for a default empty entity
  factory UserFinanceEntity.empty() {
    return UserFinanceEntity(
      uid: "uid",
      totalBalance: 0.0,
      income: 0.0,
      expense: 0.0,
    );
  }
}