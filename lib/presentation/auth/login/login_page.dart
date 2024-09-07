import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/data/gen/assets.gen.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/auth/login/provider/login_provider.dart';
import 'package:bank_mobile/presentation/main/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add provider package if not added already

import '../../../app/common/widgets/common_text_filed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(top: 10, left: 10),
          decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8))),
          padding: const EdgeInsets.all(4),
          child: Icon(
            Icons.arrow_back,
            color: context.colors.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 4 / 10,
            child: Column(
              children: [
                48.kh,
                Assets.icons.bank.image(height: 238, width: 210),
                "Solution Squad".s(32).w(700).c(context.colors.onPrimary),
                16.kh,
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: context.colors.onPrimary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Email Address".s(12).w(400).c(context.colors.display),
                8.kh,
                CommonTextField(
                  background: context.colors.grey.withOpacity(0.4),
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                16.kh,
                "Password".s(12).w(400).c(context.colors.display),
                8.kh,
                CommonTextField(
                  background: context.colors.grey.withOpacity(0.4),
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    "Forget Password?".s(12).w(400).c(context.colors.display),
                    32.kh,
                  ],
                ),
                SizedBox(
                  height: 64,
                  child: CommonButton.elevated(
                    loading: provider.isLoading,
                    text: "Sign in",
                    backgroundColor: Colors.amber,
                    onPressed: () async {
                      final username = _usernameController.text.trim();
                      final password = _passwordController.text.trim();

                      if (username.isNotEmpty && password.isNotEmpty) {
                        final success =
                            await provider.login(username, password);
                        if (success) {
                          context.push(const HomePage());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text(provider.errorMessage ?? 'Login failed'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
