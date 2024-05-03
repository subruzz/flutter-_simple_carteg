import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cart_eg/data/features/home/models/home_product_mmodels.dart';
import 'package:flutter_bloc_cart_eg/data/grocery_data.dart';
import 'package:flutter_bloc_cart_eg/data/items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomecartListNavigate>(hmecartListNavigate);
    on<HomeWishNavigate>(homeWishNavigate);
    on<HomecartListClicked>(homecartListClicked);
    on<HomeWishListClicked>(homeWishListClicked);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 4));
    emit(HomeSuccessState(
        models: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                  isLiked: false,
                  isWished: false,
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl']),
            )
            .toList()));
  }

  FutureOr<void> hmecartListNavigate(
      HomecartListNavigate event, Emitter<HomeState> emit) {
    emit(HomeCartNavState());
  }

  FutureOr<void> homeWishNavigate(
      HomeWishNavigate event, Emitter<HomeState> emit) {
    emit(HomeWishNavState());
  }

  FutureOr<void> homecartListClicked(
      HomecartListClicked event, Emitter<HomeState> emit) {
    cartItems.add(event.model);
  }

  FutureOr<void> homeWishListClicked(
      HomeWishListClicked event, Emitter<HomeState> emit) {
    wishItems.add(event.model);
  }
}
