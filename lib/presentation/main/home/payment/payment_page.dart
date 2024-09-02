
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController sum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: "Transfer to card".s(20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Recipient's account number".s(15).c(Colors.white),
            12.kh,
             CommonTextField(
               controller: cardNumber,
              background: Colors.deepPurpleAccent.withOpacity(0.1),
              prefixIcon: const Icon(CupertinoIcons.creditcard_fill, color: Colors.deepPurple,),
              hint: "0000 0000 0000 0000",
              maxLength: 16,
              keyboardType: TextInputType.number,
              enabled: true,
              enabledBorderColor: Colors.deepPurpleAccent,
            ),


            "Recipient's name".s(15).c(Colors.white),
            12.kh,
             CommonTextField(
               controller: name,
              background: Colors.deepPurpleAccent.withOpacity(0.1),
              prefixIcon: const Icon(CupertinoIcons.person_alt, color: Colors.deepPurple,),
              // hint: "0000 0000 0000 0000",
              keyboardType: TextInputType.number,
              enabled: true,
              enabledBorderColor: Colors.deepPurpleAccent,
            ),
            20.kh,
            "Summa: ".s(15).c(Colors.white),
            5.kh,
            CommonTextField(
              controller: sum,
              suffix: sum.text.length < 3 ? "Min. summa 1 000".s(10).c(Colors.red) : "".s(10),
              background: Colors.deepPurpleAccent.withOpacity(0.1),
              prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: const BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: "UZS".s(12).c(Colors.grey)
              ),
              hint: "0.00",

              enabled: true,
              enabledBorderColor: Colors.deepPurpleAccent,

              keyboardType: TextInputType.number,
            ),
            20.kh,
            "Note to recipient".s(15).c(Colors.white),
            12.kh,
             CommonTextField(
               maxLines: 7,
               minLines: 6,
               controller: desc,
               background: Colors.deepPurpleAccent.withOpacity(0.1),
               keyboardType: TextInputType.number,
               enabled: true,
               enabledBorderColor: Colors.deepPurpleAccent,
             ),
            const Spacer(),

             InkWell(
               onTap: () {
                 Navigator.pop(context);
               },
               borderRadius: const BorderRadius.all(Radius.circular(10)),
               child: Container(
                 alignment: Alignment.center,
                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                 decoration: const BoxDecoration(
                     color: Colors.deepPurpleAccent,
                     borderRadius: BorderRadius.all(Radius.circular(10))
                 ),
                 child: "Finish".s(16).c(Colors.white70),
               ),
             ),

          ],
        ),
      ),
    );
  }
}
