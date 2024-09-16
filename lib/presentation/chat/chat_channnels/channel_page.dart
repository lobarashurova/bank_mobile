import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/chat/chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  final storage = getIt<Storage>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: BaseAppBar(
        title: "User and channels",
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            final employeeData = snapshot.data?.docs;
            var filteredPeople = employeeData
                ?.where((person) =>
                    person['employee_id'] as int !=
                    (storage.userId.call() ?? 0))
                .toList();
            return ListView.builder(
              itemCount: filteredPeople?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    String chatId = generateChatId(
                            storage.userId.call().toString(),
                            (filteredPeople![index])['employee_id'].toString())
                        .toString();
                    context.push(ChatPage(
                      image: (filteredPeople![index])['iimage'],
                      id: (filteredPeople![index])['employee_id'],
                      name: (filteredPeople![index])['name'],
                      chatId: chatId,
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: height * .025,
                          backgroundImage: NetworkImage(
                              "${((filteredPeople![index])['iimage']) ?? "https://avatars.mds.yandex.net/i?id=533b54efcfde243f92260e0b5bdbc500e54895c0-9311909-images-thumbs&n=13"}"),
                        ),
                        16.kw,
                        "${(filteredPeople![index])['name']}"
                            .s(12)
                            .w(600)
                            .c(context.colors.onPrimary),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

String generateChatId(String userId1, String userId2) {
  return userId1.compareTo(userId2) < 0
      ? '$userId1\_$userId2'
      : '$userId2\_$userId1';
}
