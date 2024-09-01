import 'dart:io';

import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/management/management_page.dart';
import 'package:bank_mobile/presentation/main/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/gen/assets.gen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool mode1 = true;
  bool mode2 = true;

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Profile".s(20),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          10.kh,
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                child: file?.path != null
                    ? Image.file(
                        width: 160,
                        height: 160,
                        File(file!.path),
                        fit: BoxFit.cover,
                      )
                    : Assets.icons.profile.image(width: 160, height: 160),
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
          "User userov".s(20).c(Colors.white).w(600),
          20.kh,
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            title: "Edite profile".s(16).c(Colors.white),
            trailing: const Icon(
              Icons.navigate_next_sharp,
              size: 30,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditeProfile()));
            },
          ),
          Divider(
            color: context.colors.display,
            thickness: 1,
          ),
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
                      builder: (context) => const ManagementPage()));
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
            contentPadding: EdgeInsets.zero,
            leading: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
            ),
            title: "Push notifications".s(16).c(Colors.white),
            trailing: CupertinoSwitch(
              value: mode1,
              onChanged: (bool value) {
                setState(() {
                  mode1 = value;
                });
              },
            ),
          ),
          Divider(
            color: context.colors.display,
            thickness: 1,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(
              Icons.dark_mode_outlined,
              color: Colors.white,
            ),
            title: "Dark Theme".s(16).c(Colors.white),
            trailing: CupertinoSwitch(
              value: mode2,
              onChanged: (bool value) {
                setState(() {
                  mode2 = value;
                });
              },
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
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: "Do want to really log out?"
                          .s(20)
                          .w(500)
                          .c(context.colors.label),
                      actions: [
                        CupertinoDialogAction(
                          isDestructiveAction: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: "Cancel".s(16).w(400).c(context.colors.label),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: "Yes".s(16).w(600).c(context.colors.label),
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
      )),
    );
  }
}
