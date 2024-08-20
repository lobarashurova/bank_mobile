import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/auth/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../../data/gen/assets.gen.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({super.key});

  @override
  State<BeginPage> createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Spacer(),
            "Welcome to platform".s(24).w(700).c(context.colors.onPrimary),
            Spacer(),
            Assets.icons.bank.image(height: 238, width: 210),
            "Solution Squad".s(32).w(700).c(context.colors.onPrimary),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: CommonButton.elevated(
                backgroundColor: Colors.amber,
                text: "Start",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
