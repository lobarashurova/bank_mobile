import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/extensions/snackbar_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_notifier.dart';

class CreateNewsPage extends StatefulWidget {
  const CreateNewsPage({super.key});

  @override
  State<CreateNewsPage> createState() => _CreateNewsPageState();
}

class _CreateNewsPageState extends State<CreateNewsPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Create news",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Input news title".s(14).w(600).c(context.colors.onPrimary),
            8.kh,
            CommonTextField(
              controller: titleController,
            ),
            16.kh,
            "Input news description".s(14).w(600).c(context.colors.onPrimary),
            8.kh,
            CommonTextField(
              controller: textController,
              hint: "text...",
              minLines: 10,
              maxLines: 16,
            ),
            Spacer(),
            Consumer<NewsProvider>(
              builder: (context, provider, child) {
                return CommonButton.elevated(
                  text: "Create",
                  loading: provider.isLoading,
                  onPressed: () async {
                    if (titleController.text.length > 6 &&
                        textController.text.length > 50) {
                      final success = await provider.createNews(
                          titleController.text, textController.text);
                      if (success) {
                        Navigator.pop(context);
                      } else {
                        context.showBeautifulSnackbar(
                            message:
                                provider.errorMessage ?? "Creation failed");
                      }
                    } else {
                      context.showBeautifulSnackbar(
                          message:
                              "Title length should larger than 6, description 50");
                    }
                  },
                  backgroundColor: context.colors.primary2,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
