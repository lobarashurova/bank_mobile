import 'package:bank_mobile/data/api_model/meeting_model/meeting_model.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class EditMeetings extends StatefulWidget {
  const EditMeetings({super.key, required this.meetingModel});

  final MeetingData meetingModel;

  @override
  State<EditMeetings> createState() => _EditMeetingsState();
}

class _EditMeetingsState extends State<EditMeetings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "View meeting".s(16),
        centerTitle: true,
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Table(
              border: TableBorder.all(),
              defaultColumnWidth: FixedColumnWidth(185),
              children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Host email".s(18).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "${widget.meetingModel.hostEmail}"
                        .s(18)
                        .c(Colors.white),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Topic".s(18).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "${widget.meetingModel.pstnPassword}"
                        .s(18)
                        .c(Colors.white),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Agenda".s(18).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "${widget.meetingModel.agenda}".s(18).c(Colors.white),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: "Start time".s(18).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(
                            widget.meetingModel.startTime.toString()))
                        .s(18)
                        .c(Colors.white),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Status".s(18).c(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "${widget.meetingModel.status}".s(18).c(Colors.white),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: "Duration".s(18).c(Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: "${widget.meetingModel.duration} s"
                        .s(18)
                        .c(Colors.white),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: InkWell(
                          onTap: () async {
                            final Uri _url =
                                Uri.parse("${widget.meetingModel.joinUrl}");
                            await launchUrl(_url);
                          },
                          child: "Join URL".s(18).c(Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "${widget.meetingModel.joinUrl}".s(18).c(Colors.blue),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: "Password".s(18).c(Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child:
                        "${widget.meetingModel.password}".s(18).c(Colors.white),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
