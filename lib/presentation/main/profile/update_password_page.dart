import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/snackbar_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Update password",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Old password".s(14).w(600).c(context.colors.onPrimary),
            8.kh,
            CommonTextField(
              controller: oldPassword,
              onChanged: (text) {
                setState(() {});
              },
            ),
            16.kh,
            "New password".s(14).w(600).c(context.colors.onPrimary),
            8.kh,
            CommonTextField(
              controller: newPassword,
              onChanged: (text) {
                setState(() {});
              },
            ),
            16.kh,
            "Password confirm".s(14).w(600).c(context.colors.onPrimary),
            8.kh,
            CommonTextField(
              controller: confirmPassword,
              onChanged: (text) {
                setState(() {});
              },
            ),
            Spacer(),
            Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return CommonButton.elevated(
                  text: "Update Password",
                  backgroundColor: context.colors.primary2,
                  loading: provider.isLoading,
                  onPressed: () async {
                    if (newPassword.text.isNotEmpty &&
                        oldPassword.text.isNotEmpty &&
                        newPassword.text == confirmPassword.text) {
                      final status = await provider.updatePassword(
                          oldPassword.text, newPassword.text);
                      if (status) {
                        context.pop();
                      } else {
                        context.showBeautifulSnackbar(
                            message: provider.errorMessage ??
                                "Failed to update data");
                      }
                    } else {
                      context.showBeautifulSnackbar(message: "Check fields");
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
