part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class InitialState extends RegisterState {}

class SignUpSuccessful extends RegisterState {
  final UserModel user;
  SignUpSuccessful(this.user);
}

class SignUpFailure extends RegisterState {
  final String error;
  SignUpFailure(this.error);
}

class SignUpLoading extends RegisterState {}
