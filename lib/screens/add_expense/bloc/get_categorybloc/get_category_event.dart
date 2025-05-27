part of 'get_category_bloc.dart';

@immutable
sealed class GetCategoryEvent extends Equatable {
  final String uid;
  const GetCategoryEvent(this.uid);
  @override
  List<Object> get props => [];
}

final class GetCategories extends GetCategoryEvent {
  const GetCategories(super.uid);
}

