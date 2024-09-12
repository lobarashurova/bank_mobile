import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/material.dart';

import '../../../app/common/widgets/common_button.dart';
import '../../../app/common/widgets/common_text_filed.dart';

class EditeProfile extends StatefulWidget {
  const EditeProfile({super.key});

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
               "Full name".s(15).c(Colors.white),
               8.kh,
               CommonTextField(
                 hint: "Full name",
                 controller: fullNameController,
               ),
               16.kh,
               "Email".s(15).c(Colors.white),
               8.kh,

               CommonTextField(
                 hint: "Email",
                 controller: emailController,
               ),
               16.kh,
               "Phone number".s(15).c(Colors.white),
               8.kh,

               CommonTextField(
                 hint: "Phone number",
                 controller: phoneNumberController,
               ),
               16.kh,
               "Address".s(15).c(Colors.white),
               8.kh,

               CommonTextField(
                 hint: "Address ",
                 controller: addressController,
               ),
               16.kh,
             ],
           ),
            CommonButton.elevated(text: "Edit", backgroundColor: context.colors.primary2, textColor: context.colors.onPrimary,)

          ],
        ),
      ),
    );
  }
}
