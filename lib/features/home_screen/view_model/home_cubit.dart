import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant.dart';
import '../model/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  void getHomeData() async {
    emit(HomeLoading());
    try {
      Response response = await Dio().get(ApiConstants.HOME);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successful registration
        homeModel = HomeModel.fromJson(response.data);
        emit(HomeSuccess(homeModel!));
      } else {
        // Unexpected response
        emit(HomeError("Unexpected error: ${response.statusCode}"));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        emit(HomeError("Server not found. Try again later."));
      } else {
        emit(HomeError("Unexpected error: ${error.message}"));
      }
    }
  }
}