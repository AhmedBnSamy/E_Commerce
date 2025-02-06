import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../constants/constant.dart';
import '../../../../../models/api_login.dart';

part 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {

  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin(
      {
        required String email,
        required String password}) async {
    emit(LoginLoading ());
    try {
      var response = await Dio().post(
        ApiConstants.LOGIN,
        data: {

          'email': email,
          'password': password,

        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successful registration
        LoginModel userModel = LoginModel.fromJson(response.data);
        emit(LoginSuccessful (userModel));
      } else {
        // Unexpected response
        emit(LoginFailure("Unexpected error: ${response.statusCode}"));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          emit(LoginFailure("Invalid registration data. Please check your inputs."));
        } else if (error.response!.statusCode == 404) {
          emit(LoginFailure("Server not found. Try again later."));
        } else if (error.response!.statusCode == 409) {
          emit(LoginFailure("Email or phone number already exists."));
        } else if (error.response!.statusCode == 500) {
          emit(LoginFailure("Server error. Please try again later."));
        } else {
          emit(LoginFailure("Error: ${error.response!.statusCode}"));
        }
      } else {
        emit(LoginFailure("Network error. Please check your connection."));
      }
    } catch (error) {
      emit(LoginFailure("An unexpected error occurred: $error"));
    }
  }

}