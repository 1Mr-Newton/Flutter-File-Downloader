import 'package:flutter/material.dart';

class CustomSnackbar {
  final BuildContext context;
  final String message;
  CustomSnackbar({required this.context, required this.message}) {
    show(context, message);
  }

  void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
