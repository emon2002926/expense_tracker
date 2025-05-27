part of 'create_category_bloc.dart';

class CreateCategoryEvent extends Equatable {
  final Category category;
  final String uid;

  const CreateCategoryEvent(this.category,this.uid);

  @override
  List<Object> get props => [category];
}

// class CreateCategory extends CreateCategoryEvent {
//
//   final Category category;
//
//   const CreateCategory({required this.category});
//
//   @override
//   List<Object?> get props => [category];
//
//
//
// }
