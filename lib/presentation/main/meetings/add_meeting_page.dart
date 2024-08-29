import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/management/permissions/my_check.dart';
import 'package:flutter/material.dart';

class AddMeetingPage extends StatefulWidget {
  const AddMeetingPage({super.key});

  @override
  State<AddMeetingPage> createState() => _AddMeetingPageState();
}

class _AddMeetingPageState extends State<AddMeetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Schedule meeting",
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.check,
                color: context.colors.onPrimary,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Meeting topic".s(16).w(400).c(context.colors.onPrimary),
            4.kh,
            CommonTextField(),
            16.kh,
            "Description".s(16).w(400).c(context.colors.onPrimary),
            4.kh,
            CommonTextField(
              minLines: 5,
              hint: "write notes...",
              maxLines: 6,
            ),
            16.kh,
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      "Date".s(16).w(400).c(context.colors.onPrimary),
                      4.kh,
                      CommonTextField()
                    ],
                  ),
                ),
                16.kw,
                Flexible(
                  child: Column(
                    children: [
                      "Time".s(16).w(400).c(context.colors.onPrimary),
                      4.kh,
                      CommonTextField()
                    ],
                  ),
                ),
              ],
            ),
            16.kh,
            "Duration".s(16).w(400).c(context.colors.onPrimary),
            4.kh,
            CommonTextField(
              hint: "",
            ),
            16.kh,
            "Passcode".s(16).w(400).c(context.colors.onPrimary),
            4.kh,
            CommonTextField(
              hint: "",
            ),
            16.kh,
            "Meeting for".s(16).w(400).c(context.colors.onPrimary),
            4.kh,
            Row(
              children: [
                Column(
                  children: [
                    MyCheck(),
                    8.kh,
                    "Hr".s(14).w(600).c(context.colors.onPrimary)
                  ],
                ),
                16.kw,
                Column(
                  children: [
                    MyCheck(),
                    8.kh,
                    "Admin".s(14).w(600).c(context.colors.onPrimary)
                  ],
                ),
                16.kw,
                Column(
                  children: [
                    MyCheck(),
                    8.kh,
                    "Employee".s(14).w(600).c(context.colors.onPrimary)
                  ],
                ),
                16.kw,
              ],
            )
          ],
        ),
      ),
    );
  }
}
