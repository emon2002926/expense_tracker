import '../../domain/entities/user_finance_entity.dart';

class UserFinanceModel extends UserFinanceEntity {
  UserFinanceModel({
    required super.uid,
    required super.totalBalance,
    required super.income,
    required super.expense,
  });

  factory UserFinanceModel.fromMap(Map<String, dynamic> map) {
    return UserFinanceModel(
      uid: map['uid'],
      totalBalance: (map['totalBalance'] ?? 0).toDouble(),
      income: (map['income'] ?? 0).toDouble(),
      expense: (map['expense'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'totalBalance': totalBalance,
      'income': income,
      'expense': expense,
    };
  }
}
