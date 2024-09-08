import 'package:flutter/material.dart';

extension SnackbarExtension on BuildContext {
  void showBeautifulSnackbar({
    required String message,
    Color backgroundColor = Colors.blueAccent,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    double borderRadius = 8.0,
    EdgeInsets margin = const EdgeInsets.all(16.0),
    EdgeInsets padding = const EdgeInsets.all(16.0),
  }) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      action: action,
      behavior: SnackBarBehavior.floating,
      margin: margin,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackbar);
  }
}
