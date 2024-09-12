import 'package:animations/animations.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/main/ai/ai_model.dart';
import 'package:bank_mobile/presentation/main/ai/ai_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiChatBot extends StatefulWidget {
  const AiChatBot({super.key});

  @override
  State<AiChatBot> createState() => _AiChatBotState();
}

class _AiChatBotState extends State<AiChatBot> {
  bool isMyTurn = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var currentPlatform = Theme.of(context).platform;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final dataProvider = Provider.of<AiProvider>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff47555E),
          title: OpenContainer(
            clipBehavior: Clip.none,
            closedColor: const Color(0xff47555E),
            closedElevation: 0,
            openShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            transitionDuration: const Duration(milliseconds: 500),
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (context, action) => SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: width * .1,
                        width: width * .08,
                        child: currentPlatform == TargetPlatform.android
                            ? const Icon(
                                Icons.arrow_back,
                                color: false ? Colors.white : Colors.white,
                              )
                            : const Icon(
                                Icons.arrow_back_ios,
                                color: false ? Colors.white : Colors.white,
                              ),
                      )),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: height * .025,
                        backgroundImage: const NetworkImage(
                            "https://avatars.mds.yandex.net/i?id=24369d58b06b88a6bffe77a2da0dd0e71de70af1-9858868-images-thumbs&n=13"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.45,
                            child: const Text(
                              "Ai chatBot",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            openBuilder: (BuildContext context,
                void Function({Object? returnValue}) action) {
              return Container();
            },
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 5),
                reverse: true,
                itemCount: (dataProvider.aiList ?? []).length,
                itemBuilder: (context, index) {
                  AiModel aiModel =
                      (dataProvider.aiList ?? []).reversed.toList()[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    child: GestureDetector(
                        onTapUp: (details) {
                          if (FocusScope.of(context).hasFocus) {
                            Future.delayed(const Duration(milliseconds: 50))
                                .whenComplete(() =>
                                    FocusScope.of(context).requestFocus());
                          }
                        },
                        child: aiModel.isMe
                            ? myMessages(width, false, aiModel.text, context)
                            : friendMessages(
                                width, false, aiModel.text, context)),
                  );
                }),
          ),
          Column(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: height * 0.2),
                decoration: BoxDecoration(
                  color: const Color(0xff303841),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 13,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: TextField(
                            onTap: () {},
                            textInputAction: TextInputAction.newline,
                            onChanged: (value) {},
                            maxLines: null,
                            scrollPhysics:
                                const AlwaysScrollableScrollPhysics(),
                            keyboardType: TextInputType.multiline,
                            controller: controller,
                            keyboardAppearance: Brightness.dark,
                            cursorHeight: height * .035,
                            cursorWidth: 1,
                            style: TextStyle(
                                fontSize: 19, color: context.colors.onPrimary),
                            decoration: InputDecoration(
                                suffix: InkWell(
                                  child: Icon(
                                    Icons.send,
                                    color: context.colors.onPrimary,
                                  ),
                                  onTap: () async {
                                    if (controller.text.isNotEmpty) {
                                      setState(() {
                                        isMyTurn = true;
                                      });
                                      dataProvider
                                          .postQuestion(controller.text);
                                      controller.clear();
                                    }
                                  },
                                ),
                                hintText: 'Type your question...',
                                disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8),
                                    fontSize: 20),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row myMessages(
      double width, bool darkMode, String message, BuildContext context) {
    print("message : $message");
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: width * 0.8,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      darkMode
                          ? const Color(0xff9400D3)
                          : const Color(0xffAFD5F0),
                      darkMode
                          ? const Color(0xff7C00B8)
                          : const Color(0xffAFD5F0),
                      darkMode
                          ? const Color(0xff64009D)
                          : const Color(0xff9DCAEB),
                      darkMode
                          ? const Color(0xff4B0081)
                          : const Color(0xff9DCAEB),
                    ]),
                color: darkMode
                    ? const Color(0xff47555E)
                    : const Color(0xff7AA5D2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(0),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(7, 7, 11, 7),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row friendMessages(
      double width, bool darkMode, String message, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: width * 0.8,
              ),
              decoration: BoxDecoration(
                color: (darkMode
                    ? Colors.blueGrey.shade900
                    : Colors.grey.shade200),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
