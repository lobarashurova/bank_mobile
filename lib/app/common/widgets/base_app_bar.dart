import 'package:bank_mobile/data/gen/assets.gen.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar(
      {super.key,
      this.title,
      this.actions,
      this.centerTitle = true,
      this.leading,
      this.hasIcon = false,
      this.backgroundColor,
      this.onPressed});

  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hasIcon;
  final Color? backgroundColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      iconTheme: IconThemeData(
          color: backgroundColor == null
              ? context.colors.onPrimary
              : backgroundColor),
      leading: leading,
      centerTitle: centerTitle,
      title: hasIcon
          ? Assets.icons.eye.svg(width: 96, height: 28)
          : InkWell(
              onTap: () => onPressed?.call(),
              child: (title ?? '').w(700).s(22),
            ),
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
