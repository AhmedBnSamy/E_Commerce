import 'package:dio/dio.dart';
import 'package:ecommerce_app/constants/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../models/api_register.dart';


part 'register_state.dart';
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());

    try {
      var response = await Dio().post(
        ApiConstants.REGISTER,
        data: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "image": "https://images.pexels.com/photos/3792581/pexels-photo-3792581.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successful registration
        UserModel userModel = UserModel.fromJson(response.data);
        emit(SignUpSuccessful(userModel));
      } else {
        // Unexpected response
        emit(SignUpFailure("Unexpected error: ${response.statusCode}"));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          emit(SignUpFailure("Invalid registration data. Please check your inputs."));
        } else if (error.response!.statusCode == 404) {
          emit(SignUpFailure("Server not found. Try again later."));
        } else if (error.response!.statusCode == 409) {
          emit(SignUpFailure("Email or phone number already exists."));
        } else if (error.response!.statusCode == 500) {
          emit(SignUpFailure("Server error. Please try again later."));
        } else {
          emit(SignUpFailure("Error: ${error.response!.statusCode}"));
        }
      } else {
        emit(SignUpFailure("Network error. Please check your connection."));
      }
    } catch (error) {
      emit(SignUpFailure("An unexpected error occurred: $error"));
    }
  }

}