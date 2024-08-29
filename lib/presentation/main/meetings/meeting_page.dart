import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/meetings/add_meeting_page.dart';
import 'package:bank_mobile/presentation/main/meetings/edit_meetings.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
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
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditMeetings()));
                      } else if (direction == DismissDirection.startToEnd) {
                        // Swiped right
                      }
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      onTap: () {
                        context.push(const EditMeetings());
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
            8.kh,
            "Past Meetings".s(16).c(Colors.white).w(600),
            8.kh,
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.5),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    context.push(const EditMeetings());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow()],
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "qwerty".s(14).w(600),
                        8.kh,
                        Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            10.kw,
                            "2024-08-23\n18:00 PM"
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
            ),
          ],
        ),
      ),
    );
  }
}
