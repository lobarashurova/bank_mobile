import 'dart:io';

import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/snackbar_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/management/employee_providers/all_employees_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../app/common/widgets/common_button.dart';
import '../../../../app/common/widgets/common_text_filed.dart';
import '../../../../data/gen/assets.gen.dart';

class CreateEmployee extends StatefulWidget {
  const CreateEmployee({super.key});

  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  final ImagePicker picker = ImagePicker();
  File? file;
  XFile? pickedImage;
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

  Future pickImageFromGallery() async {
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Create employee".s(18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(1000)),
                        child: file?.path != null
                            ? Image.file(
                                width: 160,
                                height: 160,
                                File(file!.path),
                                fit: BoxFit.cover,
                              )
                            : Assets.icons.profilePng
                                .image(width: 160, height: 160),
                      ),
                      Positioned(
                          bottom: 16,
                          right: 10,
                          child: InkWell(
                              onTap: () async {
                                await pickImageFromGallery();
                              },
                              child: Assets.icons.edit.svg())),
                    ],
                  ),
                ],
              ),
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
                hint: "Address",
                controller: addressController,
              ),
              16.kh,
              "Employee(become year)".s(15).c(Colors.white),
              8.kh,
              CommonTextField(
                hint: "Employee(become year)",
                controller: employeeBecomeYearController,
              ),
              16.kh,
              "Salary".s(15).c(Colors.white),
              8.kh,
              CommonTextField(
                hint: "Salary",
                controller: salaryController,
              ),
              16.kh,
              "Username".s(15).c(Colors.white),
              8.kh,
              CommonTextField(
                hint: "Username",
                controller: userNameController,
              ),
              16.kh,
              "Date of birthday".s(15).c(Colors.white),
              8.kh,              CommonTextField(
                hint: "Date of birthday",
                controller: dateOfBirthdayController,
              ),
              16.kh,
              "Gender".s(15).c(Colors.white),
              8.kh,
              CommonTextField(
                hint: "Gender",
                controller: genderController,
              ),
              16.kh,
              "Job".s(15).c(Colors.white),
              8.kh,
              CommonTextField(
                hint: "Job",
                controller: jobController,
              ),
              16.kh,
              "Role".s(15).c(Colors.white),
              8.kh,
              CommonTextField(
                hint: "Role",
                controller: roleController,
              ),
              16.kh,
              Consumer<AllEmployeesProvider>(
                builder: (context, provider, child) {
                  return CommonButton.elevated(
                    text: "Create",
                    backgroundColor: context.colors.primary2,
                    textColor: context.colors.onPrimary,
                    onPressed: () async {
                      final status = await provider.createEmployee(UserModel(
                        name: fullNameController.text,
                        email: emailController.text,
                        address: addressController.text,
                        dob: dateOfBirthdayController.text,
                        employeeYear: employeeBecomeYearController.text,
                        gender: genderController.text,
                        specialist: jobController.text,
                        username: userNameController.text,
                        salary: "20000000",
                      ));
                      if (status) {
                        context.pop();
                      } else {
                        context.showBeautifulSnackbar(
                            message:
                                provider.errorMessage ?? "Failed to create");
                      }
                    },
                    loading: provider.isLoading,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
