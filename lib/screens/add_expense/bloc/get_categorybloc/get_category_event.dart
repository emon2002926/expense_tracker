part of 'get_category_bloc.dart';

@immutable
sealed class GetCategoryEvent extends Equatable {
  const GetCategoryEvent();
  @override
  List<Object> get props => [];
}

final class GetCategories extends GetCategoryEvent {}

