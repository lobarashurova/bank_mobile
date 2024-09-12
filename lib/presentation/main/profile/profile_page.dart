import 'dart:io';

import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:bank_mobile/extensions/navigation_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/auth/login/login_page.dart';
import 'package:bank_mobile/presentation/main/management/management_page.dart';
import 'package:bank_mobile/presentation/main/profile/edit_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../data/gen/assets.gen.dart';
import '../home/providers/home_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool mode1 = true;
  bool mode2 = true;
  final storage = getIt<Storage>();
  final ImagePicker picker = ImagePicker();
  File? file;
  XFile? pickedImage;

  Future pickImageFromGallery() async {
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: "Profile".s(20),
          ),
          body: provider.isLoading == false
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    10.kh,
                    Stack(
                      children: [
                        provider.user?.profilePhoto == null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1000)),
                                child: file?.path != null
                                    ? Image.file(
                                        width: 160,
                                        height: 160,
                                        File(file!.path),
                                        fit: BoxFit.cover,
                                      )
                                    : Assets.icons.profilePng
                                        .image(width: 160, height: 160),
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    "https://www.solutionsquad.uz/${provider.user!.profilePhoto!}",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Assets
                                        .icons.profilePng
                                        .image(width: 160, height: 160),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                        Positioned(
                            bottom: 16,
                            right: 10,
                            child: InkWell(
                                onTap: () async {
                                  await pickImageFromGallery();
                                },
                                child: Assets.icons.edit.svg())),
                      ],
                    ),
                    20.kh,
                    "${provider.user?.name}".s(20).c(Colors.white).w(600),
                    20.kh,
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      title: "Edit profile".s(16).c(Colors.white),
                      trailing: const Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditeProfile(
                                      userModel: provider.user ?? UserModel(),
                                    )));
                      },
                    ),
                    Divider(
                      color: context.colors.display,
                      thickness: 1,
                    ),
                    if (storage.role.call() != "Employee")
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                        ),
                        title: "Employee management".s(16).c(Colors.white),
                        trailing: const Icon(
                          Icons.navigate_next_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ManagementPage()));
                        },
                      ),
                    Divider(
                      color: context.colors.display,
                      thickness: 1,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.privacy_tip_outlined,
                        color: Colors.white,
                      ),
                      title: "Privacy Policy".s(16).c(Colors.white),
                      trailing: const Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),

                    Divider(
                      color: context.colors.display,
                      thickness: 1,
                    ),
                    ListTile(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (dialogContext) {
                              return CupertinoAlertDialog(
                                title: "Do want to really log out?"
                                    .s(20)
                                    .w(500)
                                    .c(context.colors.label),
                                actions: [
                                  CupertinoDialogAction(
                                    isDestructiveAction: false,
                                    onPressed: () {
                                      Navigator.pop(dialogContext);
                                    },
                                    child: "Cancel"
                                        .s(16)
                                        .w(400)
                                        .c(context.colors.label),
                                  ),
                                  CupertinoDialogAction(
                                    isDestructiveAction: false,
                                    onPressed: () {
                                      Navigator.pop(dialogContext);
                                      storage.tokens.set(null);
                                      context
                                          .pushReplacement(const LoginPage());
                                    },
                                    child: "Yes"
                                        .s(16)
                                        .w(600)
                                        .c(context.colors.label),
                                  ),
                                ],
                              );
                            });
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                      ),
                      title: "Log out".s(20).c(Colors.white),
                      trailing: const Icon(
                        Icons.navigate_next_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: context.colors.onPrimary,
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
