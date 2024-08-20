import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CommonPinPut extends StatefulWidget {
  const CommonPinPut({
    super.key,
    this.onChanged,
    this.pinController,
  });

  final ValueChanged<String>? onChanged;
  final TextEditingController? pinController;

  @override
  State<CommonPinPut> createState() => _CommonPinPutState();
}

class _CommonPinPutState extends State<CommonPinPut> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    widget.pinController?.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 46,
      textStyle: TextStyle(fontSize: 20, color: context.colors.onPrimary),
      decoration: BoxDecoration(
        color: context.colors.grey05,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.grey),
      ),
    );

    return Center(
      child: Pinput(
        autofocus: true,
        length: 6,
        controller: widget.pinController,
        focusNode: focusNode,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        separatorBuilder: (index) => const SizedBox(width: 8),
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onChanged: widget.onChanged,
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: context.colors.primary,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.colors.primary2, width: 3),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.colors.primary2, width: 3),
          ),
        ),
      ),
    );
  }
}
