import 'dart:io';

import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                        : Assets.icons.profile.image(width: 160, height: 160),
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
              CommonButton.elevated(
                text: "Create",
                backgroundColor: context.colors.primary2,
                textColor: context.colors.onPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }
}