part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}


class LoginSuccessful extends LoginState {
  final LoginModel user;
  LoginSuccessful(this.user);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}

class LoginLoading extends LoginState {}
