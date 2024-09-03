import 'package:animations/animations.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/chat/chat_utils/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool showEmoji = false;
  bool isSend = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Stream<List<MessagesModel>> getUsersStream() {
    return FirebaseFirestore.instance
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.docs
          .map((doc) {
            return MessagesModel.fromFirestore(
                doc.data() as Map<String, dynamic>, doc.id);
          })
          .toList()
          .reversed
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentPlatform = Theme.of(context).platform;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return StreamBuilder<List<MessagesModel>>(
      stream: getUsersStream(),
      builder: (context, snapshot) {
        print('data length : ${snapshot.data?.length}');
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              showEmoji = false;
            });
          },
          child: WillPopScope(
            onWillPop: () {
              if (showEmoji) {
                setState(() {
                  showEmoji = !showEmoji;
                });
                return Future.value(false);
              } else {
                return Future.value(true);
              }
            },
            child: Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color(0xff47555E),
                  title: OpenContainer(
                    clipBehavior: Clip.none,
                    closedColor: const Color(0xff47555E),
                    closedElevation: 0,
                    openShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                                        color:
                                            false ? Colors.white : Colors.white,
                                      )
                                    : const Icon(
                                        Icons.arrow_back_ios,
                                        color:
                                            false ? Colors.white : Colors.white,
                                      ),
                              )),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: height * .025,
                                backgroundImage: const NetworkImage(
                                    "https://avatars.mds.yandex.net/i?id=d6b937fa8bf7f109fb0751e8e79c7c5148b5eb4e-4705461-images-thumbs&n=13"),
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
                                      "User",
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
                          Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {},
                                child: SizedBox(
                                    width: width * .1,
                                    height: width * 0.1,
                                    child: const Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          )
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
                        itemCount: (snapshot.data ?? []).length,
                        itemBuilder: (context, index) {
                          final message =
                              (snapshot.data?[index])?.message.toString();
                          bool isMe =
                              (snapshot.data?[index])?.username.toString() ==
                                  "lobar";
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 3),
                            child: GestureDetector(
                              onTapUp: (details) {
                                if (FocusScope.of(context).hasFocus) {
                                  Future.delayed(
                                          const Duration(milliseconds: 50))
                                      .whenComplete(() => FocusScope.of(context)
                                          .requestFocus());
                                }
                                final offset = details.globalPosition;
                                showMenu(
                                    color: const Color(0xff303841),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    context: context,
                                    position: RelativeRect.fromLTRB(
                                      offset.dx,
                                      isMe ? offset.dy - 100 : offset.dy - 50,
                                      MediaQuery.of(context).size.width -
                                          offset.dx,
                                      isMe
                                          ? MediaQuery.of(context).size.height -
                                              offset.dy +
                                              100
                                          : MediaQuery.of(context).size.height -
                                              offset.dy +
                                              50,
                                    ),
                                    items: [
                                      PopupMenuItem(
                                          onTap: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: (message ?? "")
                                                        .characters
                                                        .skipLast(15)
                                                        .toString()));
                                          },
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.copy,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                ' Copy',
                                                style: TextStyle(
                                                    color: context
                                                        .colors.onPrimary),
                                              ),
                                            ],
                                          )),
                                    ]);
                              },
                              child: isMe
                                  ? myMessages(
                                      width, false, message ?? "", context)
                                  : friendMessages(
                                      width, false, message ?? "", context),
                            ),
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 17, bottom: 20),
                              child: InkWell(
                                hoverColor: Colors.red,
                                highlightColor: Colors.red,
                                focusColor: Colors.red,
                                radius: 30,
                                splashColor: Colors.red,
                                onTap: () {
                                  if (showEmoji) {
                                    FocusScope.of(context).requestFocus();
                                    setState(() {
                                      showEmoji = false;
                                    });
                                  } else {
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      showEmoji = true;
                                    });
                                  }
                                },
                                child: Icon(
                                  !showEmoji
                                      ? Icons.emoji_emotions_outlined
                                      : Icons.keyboard_alt_outlined,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 13,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: TextField(
                                    onTap: () {
                                      if (showEmoji) {
                                        setState(() => showEmoji = !showEmoji);
                                      }
                                    },
                                    textInputAction: TextInputAction.newline,
                                    onChanged: (value) {
                                      if (value.trim().length != 0) {
                                        setState(() {
                                          isSend = true;
                                        });
                                      } else {
                                        setState(() {
                                          isSend = false;
                                        });
                                      }
                                    },
                                    maxLines: null,
                                    scrollPhysics:
                                        const AlwaysScrollableScrollPhysics(),
                                    keyboardType: TextInputType.multiline,
                                    controller: controller,
                                    keyboardAppearance: Brightness.dark,
                                    cursorHeight: height * .035,
                                    cursorWidth: 1,
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: context.colors.onPrimary),
                                    decoration: InputDecoration(
                                        suffix: InkWell(
                                          child: Icon(
                                            Icons.send,
                                            color: context.colors.onPrimary,
                                          ),
                                          onTap: () async {
                                            if(controller.text.isNotEmpty){
                                              await FirebaseFirestore.instance
                                                  .collection('messages')
                                                  .add({
                                                'username': 'lobar',
                                                'message': controller.text,
                                                'createdAt':
                                                FieldValue.serverTimestamp()
                                              });
                                              controller.clear();
                                            }
                                          },
                                        ),
                                        hintText: 'Message',
                                        disabledBorder:
                                            const OutlineInputBorder(
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
            ),
          ),
        );
      },
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
