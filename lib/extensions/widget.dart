import 'package:flutter/material.dart';

extension IntX on int {
  Widget get kh => SizedBox(height: toDouble());

  Widget get kw => SizedBox(width: toDouble());
}