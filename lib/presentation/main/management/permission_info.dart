import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../app/common/widgets/common_text_filed.dart';

class PermissionInfo extends StatefulWidget {
  const PermissionInfo({super.key});

  @override
  State<PermissionInfo> createState() => _PermissionInfoState();
}

class _PermissionInfoState extends State<PermissionInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Permission info".s(18),
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
