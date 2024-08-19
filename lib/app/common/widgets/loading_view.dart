import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
