import 'package:bank_mobile/data/api_model/meeting_model/meeting_model.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/meetings/add_meeting_page.dart';
import 'package:bank_mobile/presentation/main/meetings/edit_meetings.dart';
import 'package:bank_mobile/presentation/main/meetings/provider/meetings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<String> items = [
    "qwerty",
  ];

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<MeetingsProvider>(context, listen: false).getMeetings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MeetingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.push(const AddMeetingPage());
              },
              icon: Icon(Icons.add))
        ],
        title: "All meetings".s(20),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Upcoming meeting".s(16).c(Colors.white).w(600),
            8.kh,
            provider.isLoading == false
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.3),
                    itemCount: (provider.meetings ?? []).length,
                    itemBuilder: (BuildContext context, int index) {
                      MeetingData meeting = (provider.meetings ?? [])[index];
                      return InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        onTap: () async {
                          showCupertinoDialog(
                              context: context,
                              builder: (dialogContext) {
                                return CupertinoAlertDialog(
                                  title: "What action you wanna to do?"
                                      .s(20)
                                      .w(500)
                                      .c(context.colors.label),
                                  actions: [
                                    CupertinoDialogAction(
                                      isDestructiveAction: false,
                                      onPressed: () {
                                        Navigator.pop(dialogContext);
                                        context.push(EditMeetings(
                                          meetingModel: meeting,
                                        ));
                                      },
                                      child: "View Meeting"
                                          .s(16)
                                          .w(600)
                                          .c(context.colors.label),
                                    ),
                                    CupertinoDialogAction(
                                      isDestructiveAction: false,
                                      onPressed: () async {
                                        Navigator.pop(dialogContext);
                                        final Uri _url =
                                            Uri.parse("${meeting.joinUrl}");
                                        await launchUrl(_url);
                                      },
                                      child: "Join meeting"
                                          .s(16)
                                          .w(600)
                                          .c(context.colors.label),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 5),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow()],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${meeting.agenda}".s(14).w(600),
                              16.kh,
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month_outlined),
                                  10.kw,
                                  DateFormat('dd-MM-yyyy')
                                      .format(DateTime.parse(
                                          meeting.startTime.toString()))
                                      .s(14)
                                      .c(context.colors.display)
                                      .o(TextOverflow.ellipsis)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: context.colors.onPrimary,
                      ),
                    ],
                  ),
            8.kh,
            "Past Meetings".s(16).c(Colors.white).w(600),
            8.kh,
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EditMeetings(meetingModel: ,)));
                      } else if (direction == DismissDirection.startToEnd) {
                        // Swiped right
                      }
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      onTap: () {
                        // context.push(const EditMeetings());
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow()],
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Demo checking meeting test".s(14).w(600),
                            8.kh,
                            Row(
                              children: [
                                const Icon(Icons.calendar_month_outlined),
                                16.kw,
                                "2024-08-23 18:00 PM"
                                    .s(14)
                                    .c(context.colors.display)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
