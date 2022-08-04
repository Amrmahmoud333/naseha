part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

// firebase login states
class LoginLoading extends AuthState {}

class LoginSccuess extends AuthState {}

class LoginError extends AuthState {}

// firebase Logout states
class LogoutLoading extends AuthState {}

class LogoutSccuess extends AuthState {}

class LogoutError extends AuthState {}

// firebase Register states
class RegisterLoading extends AuthState {}

class RegisterSccuess extends AuthState {}

class RegisterError extends AuthState {}
