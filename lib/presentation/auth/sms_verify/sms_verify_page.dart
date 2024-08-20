import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/data/gen/assets.gen.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/auth/verify/verified_widget/verified_widget.dart';
import 'package:bank_mobile/presentation/auth/verify/widget/common_pin_put.dart';
import 'package:flutter/material.dart';

class SmsVerifyPage extends StatefulWidget {
  const SmsVerifyPage({super.key});

  @override
  State<SmsVerifyPage> createState() => _SmsVerifyPageState();
}

class _SmsVerifyPageState extends State<SmsVerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.icons.smsVerification.image(),
            16.kh,
            "Enter code".s(24).w(700).c(context.colors.onPrimary),
            16.kh,
            "We have sent you access code from SMS for Mobile Number Verification"
                .s(16)
                .w(600)
                .c(context.colors.display)
                .a(TextAlign.center),
            16.kh,
            CommonPinPut(),
            16.kh,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: CommonButton.elevated(
                text: "Verify",
                backgroundColor: Colors.amber,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifiedWidget()));
                },
              ),
            ),
            16.kh,
            "Didn’t received code?".s(20).w(500).c(context.colors.display),
            TextButton(
                onPressed: () {},
                child: "Resend".s(20).w(500).c(context.colors.onPrimary))
          ],
        ),
      ),
    );
  }
}
