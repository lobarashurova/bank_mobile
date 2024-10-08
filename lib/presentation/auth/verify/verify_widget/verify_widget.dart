import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/auth/sms_verify/sms_verify_page.dart';
import 'package:flutter/material.dart';

import '../../../../app/common/widgets/common_button.dart';
import '../../../../data/gen/assets.gen.dart';

class VerifyWidget extends StatefulWidget {
  const VerifyWidget({super.key});

  @override
  State<VerifyWidget> createState() => _VerifyWidgetState();
}

class _VerifyWidgetState extends State<VerifyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          107.kh,
          Assets.icons.verified.image(height: 359, width: 410),
          "Verify your Number!".s(32).w(700).c(context.colors.display),
          16.kh,
          "Please enter your mobile number to \n eceive verification code"
              .s(16)
              .w(700)
              .c(context.colors.title),
          70.kh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: CommonTextField(
              background: context.colors.grey,
              hint: "Email",
            ),
          ),
          50.kh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: SizedBox(
              height: 54,
              child: CommonButton.elevated(
                text: "SEND",
                backgroundColor: Colors.amber,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SmsVerifyPage()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
