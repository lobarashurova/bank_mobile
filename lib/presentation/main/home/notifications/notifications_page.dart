import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/data/gen/assets.gen.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "All notifications",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: context.colors.onPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Assets.icons.bank.image(width: 80, height: 80),
                    16.kw,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Your account was approved!"
                              .s(16)
                              .w(600)
                              .c(context.colors.display),
                          8.kh,
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum"
                              .s(12)
                              .w(400)
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
