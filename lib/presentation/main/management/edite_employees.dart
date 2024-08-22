import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/material.dart';

class EditeEmployees extends StatefulWidget {
  const EditeEmployees({super.key});

  @override
  State<EditeEmployees> createState() => _EditeEmployeesState();
}

class _EditeEmployeesState extends State<EditeEmployees> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController employeeBecomeYearController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController dateOfBirthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Edit employee".s(18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.3,
                color: context.colors.onPrimary,
              ),
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
                hint: "Address",
                controller: addressController,
              ),
              16.kh,
          
              CommonTextField(
                hint: "Employee(become year)",
                controller: employeeBecomeYearController,
              ),
              16.kh,
          
              CommonTextField(
                hint: "Salary",
                controller: salaryController,
              ),
              16.kh,
              CommonTextField(
                hint: "Username",
                controller: userNameController,
              ),
              16.kh,
              CommonTextField(
                hint: "Date of birthday",
                controller: dateOfBirthdayController,
              ),
              16.kh,
              CommonTextField(
                hint: "Gender",
                controller: genderController,
              ),
              16.kh,
              CommonTextField(
                hint: "Job",
                controller: jobController,
              ),
              16.kh,
              CommonTextField(
                hint: "Role",
                controller: roleController,
              ),
              16.kh,
              CommonButton.elevated(text: "Update", backgroundColor: context.colors.primary2, textColor: context.colors.onPrimary,)
            ],
          ),
        ),
      ),
    );
  }
}
