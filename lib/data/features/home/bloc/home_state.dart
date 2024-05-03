part of 'home_bloc.dart';

sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<ProductDataModel> models;

  HomeSuccessState({required this.models});

}

final class HomeFailedState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeCartNavState extends HomeActionState {}

final class HomeWishNavState extends HomeActionState {}
