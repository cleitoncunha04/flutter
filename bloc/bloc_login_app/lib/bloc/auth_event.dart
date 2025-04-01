part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class LoginAuthEvent extends AuthEvent {
  LoginAuthEvent({
    required this.rawEmail,
    required this.rawPassword,
  });

  final String rawEmail;
  final String rawPassword;
}

final class LogoutAuthEvent extends AuthEvent {}
