import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page, {TO? result}) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
      result: result,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget newPage, RoutePredicate predicate) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => newPage),
      predicate,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  Future<T?> pushForResult<T extends Object?>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void popToFirst() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  bool canPop() {
    return Navigator.of(this).canPop();
  }
}
