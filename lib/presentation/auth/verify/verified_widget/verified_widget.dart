import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/home/home_page.dart';
import 'package:flutter/material.dart';
import '../../../../app/common/widgets/common_button.dart';
import '../../../../data/gen/assets.gen.dart';

class VerifiedWidget extends StatefulWidget {
  const VerifiedWidget({super.key});

  @override
  State<VerifiedWidget> createState() => _VerifiedWidgetState();
}

class _VerifiedWidgetState extends State<VerifiedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          107.kh,
          Assets.icons.verified.image(height: 359, width: 410),
          "Verified!".s(32).w(700).c(context.colors.display),
          20.kh,
          "You have successfully\nverified your phone number"
              .s(20)
              .w(700)
              .c(context.colors.title)
              .a(TextAlign.center),
          100.kh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: SizedBox(
              height: 64,
              child: CommonButton.elevated(
                text: "GO TO DASHBOARD",
                backgroundColor: Colors.amber,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
