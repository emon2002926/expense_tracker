part of 'get_category_bloc.dart';

@immutable
sealed class GetCategoryState extends Equatable{
  const GetCategoryState();

  @override
  List<Object> get props => [];
}

final class GetCategoryInitial extends GetCategoryState {}
final class GetCategoryLoading extends GetCategoryState {}
final class GetCategoryFailure extends GetCategoryState {}
final class GetCategorySuccess extends GetCategoryState {
  final List<Category> categories;
  const GetCategorySuccess(this.categories);
  @override
  List<Object> get props => [categories];
}
