import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/common/widgets/common_text_filed.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController sum = TextEditingController();
  double currencyValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Take credit".s(20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Borrower".s(15).c(Colors.white),
            12.kh,
            CommonTextField(
              controller: cardNumber,
              background: Colors.deepPurpleAccent.withOpacity(0.1),
              prefixIcon: const Icon(
                CupertinoIcons.person_alt,
                color: Colors.deepPurple,
              ),
              hint: "",
              keyboardType: TextInputType.text,
              enabled: true,
              enabledBorderColor: Colors.deepPurpleAccent,
            ),

            20.kh,

            "Amount".s(15).c(Colors.white),
            12.kh,
            CommonTextField(
              controller: cardNumber,
              background: Colors.deepPurpleAccent.withOpacity(0.1),
              prefixIcon: const Icon(
                CupertinoIcons.money_dollar,
                color: Colors.deepPurple,
              ),
              // hint: "0000 0000 0000 0000",
              keyboardType: TextInputType.number,
              enabled: true,
              enabledBorderColor: Colors.deepPurpleAccent,
            ),

            20.kh,
            "Duration: ".s(15).c(Colors.white),
            5.kh,
            // CommonTextField(
            //   controller: sum,
            //   suffix: sum.text.length < 3 ? "Min. summa 1 000".s(10).c(Colors.red) : "".s(10),
            //   background: Colors.deepPurpleAccent.withOpacity(0.1),
            //   hint: "0.00",
            //   enabled: true,
            //   enabledBorderColor: Colors.deepPurpleAccent,
            //
            //   keyboardType: TextInputType.number,
            // ),
            Slider(
              activeColor: Colors.deepPurple,
              max: 100,
                divisions: 100,
                label: "${currencyValue.round()} month",
                value: currencyValue,
                onChanged: (double value) {
                  setState(() {
                    currencyValue = value;
                  });
                },
            ),
            20.kh,
            "How much to pay each month:".s(15).c(Colors.white),
            12.kh,
            CommonTextField(
              controller: cardNumber,
              background: Colors.deepPurpleAccent.withOpacity(0.1),
              prefixIcon: const Icon(
                CupertinoIcons.sum,
                color: Colors.deepPurple,
              ),
              // hint: "0000 0000 0000 0000",
              keyboardType: TextInputType.number,
              enabled: true,
              enabledBorderColor: Colors.deepPurpleAccent,
            ),
            20.kh,

            "Description".s(15).c(Colors.white),
            12.kh,
            CommonTextField(
              maxLines: 7,
              minLines: 6,
              controller: cardNumber,
              background: Colors.deepPurpleAccent.withOpacity(0.1),
              keyboardType: TextInputType.number,
              enabled: true,
              enabledBorderColor: Colors.deepPurpleAccent,
            ),
            20.kh,

            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: "Finish".s(16).c(Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }
}
