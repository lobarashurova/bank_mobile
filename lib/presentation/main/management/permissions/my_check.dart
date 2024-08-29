import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class MyCheck extends StatefulWidget {
  const MyCheck({super.key});

  @override
  State<MyCheck> createState() => _MyCheckState();
}

class _MyCheckState extends State<MyCheck> {
  bool checkvalue = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      focusColor: context.colors.primary2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        activeColor: context.colors.primary2,

        fillColor: WidgetStatePropertyAll(context.colors.onPrimary),
        checkColor: context.colors.primary2,
        value: checkvalue,
        onChanged: (value) {
          setState(() {
            checkvalue = value!;
          });
        });
  }
}
