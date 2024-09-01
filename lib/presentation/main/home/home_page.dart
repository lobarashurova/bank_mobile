import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/home/credit/credit_page.dart';
import 'package:bank_mobile/presentation/main/home/currency/currency_page.dart';
import 'package:bank_mobile/presentation/main/home/data/grid_item_data.dart';
import 'package:bank_mobile/presentation/main/home/data/news_class.dart';
import 'package:bank_mobile/presentation/main/home/deposit/deposit_page.dart';
import 'package:bank_mobile/presentation/main/home/notifications/notifications_page.dart';
import 'package:bank_mobile/presentation/main/home/payment/payment_page.dart';
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
      "Take Credit".s(15).c(Colors.white),
      CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
        child: Icon(
          CupertinoIcons.person_alt,
          color: Colors.white,
        ),
      ),
      CreditPage(),
    ),
    Item(
      "Deposits".s(15).c(Colors.white),
      CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
      DepositPage()
    ),
    Item(
      "Currency".s(15).c(Colors.white),
      CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
        child: Icon(
          CupertinoIcons.money_dollar_circle_fill,
          color: Colors.white,
        ),
      ),
      CurrencyPage()
    ),
    Item(
      "Payment and transfers".s(15).c(Colors.white),
      CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
        child: const Icon(
          CupertinoIcons.doc,
          color: Colors.white,
        ),
      ),
      PaymentPage()
    )
  ];




  bool expend = false;

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
                          context.push(const NotificationsPage());
                        },
                        icon: const Icon(
                          CupertinoIcons.bell,
                          color: Colors.white,
                        ))
                  ],
                ),
                16.kh,

                ///#gridview
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
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => items[index].widget));
                      },
                      child: Container(
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
                              items[index].icon,
                              32.kh,
                              Center(
                                child: items[index].title,
                              )
                            ],
                          )),
                    );
                  },
                ),

                16.kh,

                ///#News
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "News".w(600).s(25).c(Colors.white),
                    10.kw,
                    InkWell(
                      onTap: () {
                        setState(() {
                          expend = !expend;
                        });
                      },
                      child: expend
                          ? "expend".s(20).c(Colors.white)
                          : "shorten".s(20).c(Colors.white),
                    )
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: expend ? 3 : 10,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent.withOpacity(0.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Row(
                               children: [
                                 const Badge(backgroundColor: Colors.green,),
                                 " News".s(18).c(Colors.green),
                               ],
                             ),
                              10.kh,
                              "Асадбек Тоштемиров завоевал четвертую золотую медаль Паралимпийских игр для Узбекистана.".s(13).c(Colors.white),
                              10.kh,
                              "01.08.2024".s(13).c(Colors.white70)
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
