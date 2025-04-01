// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_login_app/model/validator.dart';

class PasswordModel implements Validator {
  PasswordModel({
    required this.value,
  }) {
    validate();
  }

  final String value;

  @override
  void validate() {
    if (value.length < 6) {
      throw TooShortPasswordException();
    }

    final RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$');

    if (!regex.hasMatch(value)) {
      throw InvalidPasswordException();
    }
  }

  @override
  String toString() => value;
}

class TooShortPasswordException implements Exception {
  TooShortPasswordException({
    this.message = 'Password must have at least 6 characters...',
  });

  final String message;

  @override
  String toString() => message;
}

class InvalidPasswordException implements Exception {
  InvalidPasswordException({
    this.message = 'Password must have numbers and letters...',
  });

  final String message;

  @override
  String toString() => message;
}
