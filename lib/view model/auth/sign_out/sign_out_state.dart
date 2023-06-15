part of 'sign_out_cubit.dart';

@immutable
abstract class SignOutState {}

class SignOutInitial extends SignOutState {}
class SignOutSuccessState extends SignOutState {}
class SignOutErrorState extends SignOutState {}
