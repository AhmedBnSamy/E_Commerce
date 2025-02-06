import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart_screen.dart';
import '../../features/home_screen.dart';
import '../../features/offer_screen.dart';
import '../../features/profile_screen.dart';
import '../../features/search_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  int currentIndex = 0;
  static LayoutCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    OfferScreen(),
    ProfileScreen()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBarState());
  }
}
