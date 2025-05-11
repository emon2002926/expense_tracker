
import '../entities/category_entity.dart';

class Category {
  String categoryId;
  String name;
  String totalExpense;
  String icon;
  int color;
  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  static final empty = Category(categoryId: '', name: '', totalExpense: '', icon: '', color: 0);

  CategoryEntity toEntity(){
    return CategoryEntity(
        categoryId: categoryId,
        name: name,
        totalExpense: totalExpense,
        icon: icon,
        color: color);
  }

  static Category fromEntity(CategoryEntity entity){
    return Category(
        categoryId: entity.categoryId,
        name: entity.name,
        totalExpense: entity.totalExpense,
        icon: entity.icon,
        color: entity.color);
  }
}