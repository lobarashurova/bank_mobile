import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/meetings/add_meeting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditMeetings extends StatefulWidget {
  const EditMeetings({super.key});

  @override
  State<EditMeetings> createState() => _EditMeetingsState();
}

class _EditMeetingsState extends State<EditMeetings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Meeting data".s(16),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Table(
              border: TableBorder.all(
                  color: context.colors.onPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              defaultColumnWidth: FixedColumnWidth(185),
              children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Host email".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "muhibbilayeva@gamil.com".s(18).c(Colors.white).w(500),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Topic".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "muhibbilayeva@gamil.com".s(18).c(Colors.white).w(500),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Agenda".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "muhibbilayeva@gamil.com".s(18).c(Colors.white).w(500),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: "Start time".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "2024-08-30Tz".s(18).c(Colors.white).w(500),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Status".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "waiting".s(18).c(Colors.white).w(500),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Duration".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: "40 s".s(18).c(Colors.white).w(500),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Join URL".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "https://chatgpt.com/c/6bf2847a-5682-44c3-b87b-b20924e76054"
                            .s(18)
                            .c(Colors.blue)
                            .w(500),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Password".s(16).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "qwerty".s(18).c(Colors.white).w(500),
                  ),
                ]),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: CommonButton.elevated(
                    text: "Delete",
                    backgroundColor: context.colors.warningLight,
                    onPressed: () {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: "Do want to really delete this meeting?"
                                  .s(20)
                                  .w(500)
                                  .c(context.colors.label),
                              actions: [
                                CupertinoDialogAction(
                                  isDestructiveAction: false,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: "Cancel"
                                      .s(16)
                                      .w(400)
                                      .c(context.colors.label),
                                ),
                                CupertinoDialogAction(
                                  isDestructiveAction: false,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: "Delete"
                                      .s(16)
                                      .w(600)
                                      .c(context.colors.label),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ),
                16.kw,
                Flexible(
                    child: CommonButton.elevated(
                  text: "Edit",
                  backgroundColor: context.colors.primary2,
                  onPressed: () {
                    context.push(AddMeetingPage());
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
