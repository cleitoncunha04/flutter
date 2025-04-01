import 'package:bloc_login_app/pallete.dart';
import 'package:flutter/material.dart';

final class CustomSnackbar {
  CustomSnackbar({
    required this.message,
    this.isError = false,
    required this.context,
  });

  final String message;

  final bool isError;

  final BuildContext context;

  Future<void> show() async {
    final SnackBar snackBar = SnackBar(
      backgroundColor: isError ? Colors.red : const Color.fromARGB(255, 44, 102, 46),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(
        milliseconds: 1500,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Pallete.whiteColor,
            ),
          ),
          Icon(
            isError ? Icons.close : Icons.check,
            color: Pallete.whiteColor,
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
