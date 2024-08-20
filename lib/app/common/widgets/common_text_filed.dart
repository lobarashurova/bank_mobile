import 'package:bank_mobile/data/gen/assets.gen.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.errorText,
    this.onChanged,
    this.keyboardType,
    this.inputFormatter,
    this.enabled,
    this.suffix,
    this.mask,
    this.maxLength,
    this.enabledBorderColor,
    this.background,
    this.suffixPressed,
    this.moneyInput = false,
    this.autofocus = false,
    this.padding,
    this.initialValue,
    this.textInputAction,
    this.labelText,
    this.onTap,
    this.minLines,
    this.maxLines = 1,
  });

  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool obscureText;
  final bool? enabled;
  final String? labelText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final Color? enabledBorderColor;
  final Color? background;
  final String? mask;
  final int? maxLength;
  final VoidCallback? suffixPressed;
  final bool moneyInput;
  final bool autofocus;
  final EdgeInsets? padding;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? minLines;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool passwordVisible = false;
  late MaskTextInputFormatter maskFormatter;
  final FocusNode _textFieldFocusNode = FocusNode();
  List<TextInputFormatter> inputFormatters = [];

  @override
  void initState() {
    passwordVisible = widget.obscureText;
    super.initState();
    maskFormatter = MaskTextInputFormatter(
      mask: widget.mask,
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
    inputFormatters.addAll(widget.inputFormatter ?? []);
    inputFormatters.add(maskFormatter);
    // _textFieldFocusNode.addListener(() {
    //   if (widget.onFocusChanged != null) {
    //     widget.onFocusChanged!(_textFieldFocusNode.hasFocus);
    //   }
    // });
  }

  @override
  void dispose() {
    maskFormatter.clear();
    widget.controller?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      initialValue: widget.initialValue,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      controller: widget.controller,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      obscureText: passwordVisible,
      cursorColor: context.colors.primary,
      textAlign: TextAlign.start,
      inputFormatters: inputFormatters,
      onChanged: widget.onChanged == null
          ? null
          : (phone) {
              final number = widget.moneyInput
                  ? phone.replaceAll(' ', '')
                  : maskFormatter.unmaskText(phone);
              widget.onChanged!(number);
            },
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        filled: true,
        labelText: widget.labelText,
        alignLabelWithHint: true,
        labelStyle:
            GoogleFonts.nunito(fontSize: 12, color: context.colors.display),
        fillColor: widget.background,
        hintText: widget.hint,
        errorText: widget.errorText,
        errorMaxLines: 5,
        contentPadding: widget.padding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Align(
                widthFactor: 1,
                alignment: Alignment.center,
                child: widget.prefixIcon,
              ),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: context.colors.display,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.errorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.obscureText
            ? InkWell(
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                child: passwordVisible
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        child: Assets.icons.eye.svg(
                            width: 24,
                            height: 24,
                            color: context.colors.primary))
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        child: Assets.icons.uneye.svg(
                            width: 24,
                            height: 24,
                            color: context.colors.primary),
                      ),
                onTap: () {
                  setState(() => passwordVisible = !passwordVisible);
                },
              )
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.suffix,
              ),
      ),
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: context.colors.display,
      ),
    );
  }
}

class PriceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    newText = newText.replaceAll(RegExp(r'\D'), '');

    String formattedText = '';
    int len = newText.length;
    for (int i = len - 1; i >= 0; i--) {
      formattedText = newText[i] + formattedText;
      if ((len - i) % 3 == 0 && i != 0) {
        formattedText = ' $formattedText';
      }
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
