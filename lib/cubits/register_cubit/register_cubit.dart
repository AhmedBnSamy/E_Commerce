import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/constants/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/api_login.dart';
import '../../models/api_register.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister(
      {required String name,
        required String phone,
        required String email,
        required String password}) async {
    emit(SignUpLoading());
    try {
      var response = await Dio().post(
        ApiConstants.REGISTER,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          "image":
          "https://img.freepik.com/free-vector/isolated-young-handsome-man-different-poses-white-background-illustration_632498-859.jpg?t=st=1738695804~exp=1738699404~hmac=907da3722d5a50129709e327874a9e25e784f10b19c6f544ba059af56bca6118&w=1060",
        },
      );
      UserModel userModel = UserModel.fromJson(response.data);
      emit(SignUpSuccessful(userModel));
    } catch (e) {
      SignUpFailure(e.toString());
    }
  }
}