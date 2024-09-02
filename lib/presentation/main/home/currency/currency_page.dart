import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/home/currency/currency_class.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  List<CurrencyClass> texts = [
    CurrencyClass("1 AQSH dollari, USD", 12620.00, 12680.00),
    CurrencyClass("1 Yevro EUR", 3800.00, 14050.00),
    CurrencyClass("1 Rossiya rubli RUB", 125.00, 145.00),
    CurrencyClass("1 Angliya funt sterlini GBP", 16400.00, 17100.00),
    CurrencyClass("1 Shvetsiya franki CHF", 14700.00, 15400.00),
    CurrencyClass("1 Japoniya iyensi JPY", 70.00, 90.00),
    CurrencyClass("1 Qozog'iston tengesi KZT", 15.00, 30.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Currency".s(16),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: texts.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: context.colors.display.withOpacity(0.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Name of Currency:"
                                .s(17)
                                .c(Colors.deepPurpleAccent)
                                .w(600),
                            texts[index]
                                .currencyName
                                .s(16)
                                .c(context.colors.onPrimary),
                            16.kh,
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Buy:"
                                        .s(17)
                                        .c(Colors.deepPurpleAccent)
                                        .w(600),
                                    texts[index]
                                        .buy
                                        .toString()
                                        .s(16)
                                        .c(context.colors.onPrimary),
                                  ],
                                ),
                                40.kw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Sell:"
                                        .s(17)
                                        .c(Colors.deepPurpleAccent)
                                        .w(600),
                                    texts[index]
                                        .sell
                                        .toString()
                                        .s(16)
                                        .c(context.colors.onPrimary),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ));
                  }),
              20.kh,
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: context.colors.display.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Currency conventor".s(20).c(context.colors.onPrimary),
                      16.kh,
                      CommonTextField(
                        hint: "1",
                      ),
                      10.kh,
                      CommonTextField(
                        prefixIcon: "USD".s(14).c(context.colors.onPrimary),
                        suffix: Transform.rotate(angle: 1.5,
                        child: InkWell(child: Icon(Icons.navigate_next, color: context.colors.onPrimary,), onTap: (){},),),
                      ),
                      10.kh,
                      CommonTextField(
                        hint: "12620.00",
                      ),
                      10.kh,
                      CommonTextField(
                        hint: "UZS",
                      ),
                      10.kh,
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
