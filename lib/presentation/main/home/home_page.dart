import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/home/data/grid_item_data.dart';
import 'package:bank_mobile/presentation/main/home/notifications/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> items = [
    Item(
        "Total sales".s(15).c(Colors.white),
        const Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
        1452,
        "+9.4% from previous period".c(Colors.green)),
    Item(
        "New orders".s(15).c(Colors.white),
        const Icon(
          Icons.attach_money,
          color: Colors.white,
        ),
        938,
        "-1.09% from previous period".c(Colors.red)),
    Item(
        "New users".s(15).c(Colors.white),
        const Icon(
          Icons.person,
          color: Colors.white,
        ),
        8246,
        "+16.2% from previous period".c(Colors.green)),
    Item(
        "Unique visitors".s(15).c(Colors.white),
        const Icon(
          Icons.query_stats_outlined,
          color: Colors.white,
        ),
        29670,
        "+11.7% from previous period".c(Colors.green)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Hello user!".s(20).c(Colors.white).w(700),
                    IconButton(
                        onPressed: () {
                          context.push(NotificationsPage());
                        },
                        icon: Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ))
                  ],
                ),
                16.kh,
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10.0, // Space between columns
                    mainAxisSpacing: 10.0, // Space between rows
                  ),
                  itemCount: items.length,
                  // Total number of items (2 rows * 3 columns)
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colors.primary),
                          borderRadius: BorderRadius.circular(10),
                          color: context.colors.label,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              // Shadow color
                              spreadRadius: 1,
                              // Spread radius
                              blurRadius: 3,
                              // Blur radius
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [items[index].title, items[index].icon],
                            ),
                            32.kh,
                            "${items[index].number}".s(25).c(Colors.white),
                            10.kh,
                            items[index].description,
                          ],
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
