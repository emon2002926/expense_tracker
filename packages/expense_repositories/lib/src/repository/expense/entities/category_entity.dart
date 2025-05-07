class CategoryEntity {
  String categoryId;
  String name;
  String totalExpense;
  String icon;
  int color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  Map<String, Object?> toDocument(){
    return {
      'categoryId': categoryId,
      'name': name,
      'totalExpense': totalExpense,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc){
    return CategoryEntity(
      categoryId: doc['categoryId'],
      name: doc['name'],
      totalExpense: doc['totalExpense'],
      icon: doc['icon'],
      color: doc['color'],
    );
  }
}