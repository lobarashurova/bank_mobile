import 'package:bank_mobile/data/api_model/news_model/news_model.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/chat/chat_page.dart';
import 'package:bank_mobile/presentation/main/ai/ai_chat_bot.dart';
import 'package:bank_mobile/presentation/main/home/data/grid_item_data.dart';
import 'package:bank_mobile/presentation/main/home/news/create_news_page.dart';
import 'package:bank_mobile/presentation/main/home/news/update_news.dart';
import 'package:bank_mobile/presentation/main/home/notifications/notifications_page.dart';
import 'package:bank_mobile/presentation/main/home/payment/payment_page.dart';
import 'package:bank_mobile/presentation/main/home/providers/home_provider.dart';
import 'package:bank_mobile/presentation/main/home/providers/news_notifier.dart';
import 'package:bank_mobile/presentation/main/home/widgets/bar_widget.dart';
import 'package:bank_mobile/presentation/main/home/widgets/income_line_charts.dart';
import 'package:bank_mobile/presentation/main/home/widgets/outcome_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:provider/provider.dart';

import 'credit/credit_page.dart';
import 'currency/currency_page.dart';
import 'deposit/deposit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<HomeProvider>(context, listen: false).getUserData();
      Provider.of<NewsProvider>(context, listen: false).getAllNews();
    });
    super.initState();
  }

  final storage = getIt<Storage>();
  final List<double> data = [10, 12, 8, 15, 7];
  bool expend = false;
  final List<Item> items = [
    Item(
      "Take Credit".s(15).c(Colors.white),
      CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
        child: const Icon(
          CupertinoIcons.person_alt,
          color: Colors.white,
        ),
      ),
      const CreditPage(),
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
        DepositPage()),
    Item(
        "Currency".s(15).c(Colors.white),
        CircleAvatar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
          child: const Icon(
            CupertinoIcons.money_dollar_circle_fill,
            color: Colors.white,
          ),
        ),
        CurrencyPage()),
    Item(
        "Payment and transfers".s(15).c(Colors.white),
        CircleAvatar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
          child: const Icon(
            CupertinoIcons.doc,
            color: Colors.white,
          ),
        ),
        PaymentPage())
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.colors.onPrimary,
      backgroundColor: context.colors.scaffoldColor,
      onRefresh: () async {
        await Provider.of<NewsProvider>(context, listen: false).getAllNews();
      },
      child: Scaffold(
          body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        "Hello user!".s(20).c(Colors.white).w(700),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              context.push(NotificationsPage());
                            },
                            icon: const Icon(
                              CupertinoIcons.bell,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              context.push(AiChatBot());
                            },
                            icon: Icon(
                              Icons.rocket_launch,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    16.kh,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.1,
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0, // Space between columns
                        mainAxisSpacing: 10.0, // Space between rows
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => items[index].widget));
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: context.colors.primary),
                                borderRadius: BorderRadius.circular(10),
                                color: context.colors.label,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset:
                                        Offset(0, 3), // Offset of the shadow
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "News".w(600).s(25).c(Colors.white),
                        Spacer(),
                        InkWell(
                          overlayColor: WidgetStateColor.transparent,
                          onTap: () {
                            setState(() {
                              expend = !expend;
                            });
                          },
                          child: Row(
                            children: [
                              expend
                                  ? "expend".s(14).c(Colors.white).w(500)
                                  : "shorten".s(14).c(Colors.white).w(500),
                              Transform.rotate(
                                angle: 4.7,
                                child: Icon(
                                  expend
                                      ? Icons.navigate_next_sharp
                                      : Icons.navigate_before_outlined,
                                  color: context.colors.onPrimary,
                                ),
                              )
                            ],
                          ),
                        ),
                        if (storage.role.call() == "Admin")
                          IconButton(
                              onPressed: () {
                                context.push(const CreateNewsPage());
                              },
                              icon: Icon(
                                Icons.add_box_outlined,
                                color: context.colors.onPrimary,
                              ))
                      ],
                    ),
                    16.kh,
                    Consumer<NewsProvider>(
                      builder: (context, provider, child) {
                        return provider.isLoading == false
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: expend
                                    ? 2
                                    : (provider.newsList ?? []).length,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                    overlayColor: const WidgetStatePropertyAll(
                                        Colors.transparent),
                                    onTap: () {
                                      context.push(UpdateNewsPage(
                                          newsModel: provider.newsList?[i] ??
                                              NewsModel(
                                                  title: "",
                                                  text: "text",
                                                  imageUrl: "")));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurpleAccent
                                                .withOpacity(0.1),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Badge(
                                                  backgroundColor: Colors.green,
                                                ),
                                                4.kw,
                                                Flexible(
                                                  child:
                                                      "${provider.newsList?[i].title}"
                                                          .s(16)
                                                          .c(Colors.green)
                                                          .w(600),
                                                ),
                                              ],
                                            ),
                                            10.kh,
                                            ((html_parser
                                                                    .parse(provider
                                                                        .newsList?[
                                                                            i]
                                                                        .text)
                                                                    .body
                                                                    ?.text ??
                                                                "")
                                                            .length >
                                                        50
                                                    ? "${html_parser.parse(provider.newsList?[i].text).body?.text.substring(0, 50)}..."
                                                    : "${html_parser.parse(provider.newsList?[i].text).body?.text}")
                                                .s(13)
                                                .c(Colors.white),
                                            10.kh,
                                            "01.08.2024".s(13).c(Colors.white70)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Center(
                                child: CircularProgressIndicator(
                                  color: context.colors.onPrimary,
                                ),
                              );
                      },
                    ),
                    16.kh,
                    "Outcomes".s(14).w(600).c(context.colors.onPrimary),
                    16.kh,
                    OutcomeLine(),
                    "Incomes".s(14).w(600).c(context.colors.onPrimary),
                    16.kh,
                    InComeLine(),
                    16.kh,
                    "Daily benefit".s(14).w(600).c(context.colors.onPrimary),
                    32.kh,
                    BarWidget()
                  ],
                ),
              ),
            ),
            Positioned(
                right: 15,
                bottom: 15,
                child: FloatingActionButton(
                  onPressed: () {
                    context.push(ChatPage());
                  },
                  child: Icon(
                    Icons.chat,
                    color: context.colors.onPrimary,
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
