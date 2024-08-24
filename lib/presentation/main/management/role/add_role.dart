import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/management/role/role_info.dart';
import 'package:flutter/material.dart';

import '../../../../app/common/widgets/common_button.dart';
import '../../../../app/common/widgets/common_text_filed.dart';

class AddRole extends StatefulWidget {
  const AddRole({super.key});

  @override
  State<AddRole> createState() => _AddRoleState();
}

class _AddRoleState extends State<AddRole> {
  TextEditingController roleName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Role".s(18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextField(
              hint: "Role name",
              controller: roleName,


            ),
            16.kh,
            CommonButton.elevated(
              text: "Add",
              backgroundColor: context.colors.primary2,
              textColor: context.colors.onPrimary,
              onPressed: () {
                setState(() {
                  roles.add(roleName.text);
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
