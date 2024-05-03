part of 'home_bloc.dart';

sealed class HomeEvent {}

final class HomeInitialEvent extends HomeEvent {}

final class HomeWishListClicked extends HomeEvent {
  final ProductDataModel model;

  HomeWishListClicked({required this.model});
}

final class HomecartListClicked extends HomeEvent {
  final ProductDataModel model;

  HomecartListClicked({required this.model});
}

final class HomecartListNavigate extends HomeEvent {}

final class HomeWishNavigate extends HomeEvent {}
