import 'package:bank_mobile/app/common/widgets/base_app_bar.dart';
import 'package:bank_mobile/app/common/widgets/common_button.dart';
import 'package:bank_mobile/app/common/widgets/common_text_filed.dart';
import 'package:bank_mobile/data/api_model/news_model/news_model.dart';
import 'package:bank_mobile/data/gen/assets.gen.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/snackbar_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_notifier.dart';

class UpdateNewsPage extends StatefulWidget {
  final NewsModel newsModel;

  const UpdateNewsPage({super.key, required this.newsModel});

  @override
  State<UpdateNewsPage> createState() => _UpdateNewsPageState();
}

class _UpdateNewsPageState extends State<UpdateNewsPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  final storage = getIt<Storage>();

  @override
  void initState() {
    titleController.text = widget.newsModel.title;
    textController.text = widget.newsModel.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: storage.role.call() == "Admin" ? "Update news" : "View news",
        actions: [
          if (storage.role.call() == "Admin")
            IconButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (dialogContext) {
                        return CupertinoAlertDialog(
                          title: "Do want to really delete this news?"
                              .s(20)
                              .w(500)
                              .c(context.colors.label),
                          actions: [
                            CupertinoDialogAction(
                              isDestructiveAction: false,
                              onPressed: () {
                                Navigator.pop(dialogContext);
                              },
                              child:
                                  "Cancel".s(16).w(400).c(context.colors.label),
                            ),
                            CupertinoDialogAction(
                              isDestructiveAction: false,
                              onPressed: () async {
                                final status = await Provider.of<NewsProvider>(
                                        context,
                                        listen: false)
                                    .deleteNews(widget.newsModel.id ?? 0);
                                if (status) {
                                  Navigator.of(dialogContext).pop();
                                  context.pop();
                                  context.showBeautifulSnackbar(
                                      message: "Successfully deleted!");
                                } else {
                                  Navigator.of(dialogContext).pop();
                                  context.showBeautifulSnackbar(
                                      message: "Something went wrong");
                                }
                              },
                              child: "Yes".s(16).w(600).c(context.colors.label),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.delete,
                  color: context.colors.onPrimary,
                ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "${storage.role.call() == "Admin" ? "Input" : "View"} news title"
                .s(14)
                .w(600)
                .c(context.colors.onPrimary),
            8.kh,
            CommonTextField(
              controller: titleController,
              enabled: storage.role.call() == "Admin",
            ),
            16.kh,
            "${storage.role.call() == "Admin" ? "Input" : "View"} news description"
                .s(14)
                .w(600)
                .c(context.colors.onPrimary),
            8.kh,
            CommonTextField(
              controller: textController,
              hint: "text...",
              minLines: 6,
              maxLines: 16,
              enabled: storage.role.call() == "Admin",
            ),
            16.kh,
            CachedNetworkImage(
              imageUrl: widget.newsModel.imageUrl ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                 Assets.icons.verifyPic.image(width: MediaQuery.of(context).size.width, height: 200),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Spacer(),
            if (storage.role.call() == "Admin")
              Consumer<NewsProvider>(
                builder: (context, provider, child) {
                  return CommonButton.elevated(
                    loading: provider.isLoading,
                    backgroundColor: context.colors.primary2,
                    text: "Update",
                    onPressed: () async {
                      if (titleController.text.length > 6 &&
                          textController.text.length > 50) {
                        final success = await provider.updateNews(NewsModel(
                            title: titleController.text,
                            text: textController.text,
                            id: widget.newsModel.id,
                            imageUrl: widget.newsModel.imageUrl));
                        if (success) {
                          Navigator.pop(context);
                        } else {
                          context.showBeautifulSnackbar(
                              message:
                                  provider.errorMessage ?? "Updating failed");
                        }
                      } else {
                        context.showBeautifulSnackbar(
                            message:
                                "Title length should larger than 6, description 50");
                      }
                    },
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
