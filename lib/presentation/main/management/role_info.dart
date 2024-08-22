import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../app/common/widgets/common_text_filed.dart';

class RoleInfo extends StatefulWidget {
  const RoleInfo({super.key});

  @override
  State<RoleInfo> createState() => _RoleInfoState();
}

class _RoleInfoState extends State<RoleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Role info".s(18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CommonTextField(
              prefixIcon: Icon(Icons.search, color: context.colors.onPrimary,),
              hint: "Search",
              background: context.colors.grey.withOpacity(0.4),),
          ],
        ),
      ),
    );
  }
}
