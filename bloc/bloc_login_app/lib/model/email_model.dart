// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_login_app/model/validator.dart';

class EmailModel implements Validator {
  EmailModel({required this.value}) {
    validate();
  }

  final String value;

  @override
  void validate() {
    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!regex.hasMatch(value)) {
      throw InvalidEmailException();
    }
  }

  @override
  String toString() => value;
}

class InvalidEmailException implements Exception {
  InvalidEmailException({
    this.message = 'Email isn\'t valid...',
  });
  final String message;

  @override
  String toString() => message;
}
