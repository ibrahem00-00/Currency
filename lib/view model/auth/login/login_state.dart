part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginGetFormFirebaseSuccessState extends LoginState {
  UserModel userModel;
  LoginGetFormFirebaseSuccessState({required this.userModel});
}
class LoginGetFormFirebaseErrorState extends LoginState {}
class LoginErrorState extends LoginState {}


