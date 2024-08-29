import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/meetings/edit_meetings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        title: "All meetings".s(20),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Upcoming meeting".s(16).c(Colors.white),
            20.kh,
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
                itemBuilder: (context, index){
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditMeetings()));
                  } else if (direction == DismissDirection.startToEnd) {
                    // Swiped right
                  }
                },
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow()],
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Demo checking meeting test".s(14).w(600),
                        8.kh,
                        Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            16.kw,
                            "2024-08-23 18:00 PM".s(14).c(context.colors.display)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
            "Past Meetings".s(16).c(Colors.white),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
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
