import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/snackbar_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/common/widgets/common_button.dart';
import '../../../app/common/widgets/common_text_filed.dart';

class EditeProfile extends StatefulWidget {
  const EditeProfile({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    fullNameController.text = widget.userModel.name ?? "";
    phoneNumberController.text = widget.userModel.phoneNumber ?? "";
    emailController.text = widget.userModel.email ?? "";
    addressController.text = widget.userModel.address ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "My details".s(20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                16.kh,
                CommonTextField(
                  hint: "Full name",
                  controller: fullNameController,
                ),
                16.kh,
                CommonTextField(
                  hint: "Email",
                  controller: emailController,
                ),
                16.kh,
                CommonTextField(
                  hint: "Phone number",
                  controller: phoneNumberController,
                ),
                16.kh,
                CommonTextField(
                  hint: "Address ",
                  controller: addressController,
                ),
                16.kh,
              ],
            ),
            CommonButton.elevated(
              text: "Edit",
              backgroundColor: context.colors.primary2,
              textColor: context.colors.onPrimary,
              onPressed: () async {
                final status = await provider.updateProfile(UserModel(
                    id: widget.userModel.id,
                    name: fullNameController.text,
                    email: emailController.text,
                    address: addressController.text,
                    phoneNumber: phoneNumberController.text));
                if (status) {
                  context.pop();
                } else {
                  context.showBeautifulSnackbar(
                      message:
                          provider.errorMessage ?? "Failed to update data");
                }
              },
              loading: provider.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
