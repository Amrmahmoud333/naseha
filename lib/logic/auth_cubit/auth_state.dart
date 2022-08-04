part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

// firebase login states
class LoginLoading extends AuthState {}

class LoginSccuess extends AuthState {}

class LoginError extends AuthState {}
