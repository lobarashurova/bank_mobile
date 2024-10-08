import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/data/gen/assets.gen.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8))),
          padding: EdgeInsets.all(4),
          child: Icon(
            Icons.arrow_back,
            color: context.colors.primary,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          48.kh,
          Assets.icons.bank.image(height: 238, width: 210),
          "Solution Squad".s(32).w(700).c(context.colors.onPrimary),
          16.kh,
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  color: context.colors.onPrimary,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Full Name".s(12).w(400).c(context.colors.display),
                  8.kh,
                  CommonTextField(),
                  16.kh,
                  "Email Address".s(12).w(400).c(context.colors.display),
                  8.kh,
                  CommonTextField(),
                  16.kh,
                  "Password".s(12).w(400).c(context.colors.display),
                  8.kh,
                  CommonTextField(
                    obscureText: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      "Forget Password?".s(12).w(400).c(context.colors.display),
                      32.kh,
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 64,
                          child: CommonButton.elevated(
                            text: "Sign up",
                            backgroundColor: Colors.amber,
                          ),
                        ),
                      ),
                      16.kw,
                      Assets.icons.google.image(width: 64, height: 62)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
