part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  AuthSuccess({
    required this.email,
    required this.password,
  });

  final EmailModel email;
  final PasswordModel password;
}

final class AuthFailure extends AuthState {
  AuthFailure({
    required this.message,
  });

  final String message;
}

final class AuthLoading extends AuthState {}
