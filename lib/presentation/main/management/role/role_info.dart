import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/management/role/add_role.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/common/widgets/common_text_filed.dart';

List<String> roles = ["Admin", "HR", "Employee"];

class RoleInfo extends StatefulWidget {
  const RoleInfo({super.key});

  @override
  State<RoleInfo> createState() => _RoleInfoState();
}

class _RoleInfoState extends State<RoleInfo> {
  TextEditingController editRole = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Role info".s(18),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonTextField(
                prefixIcon: Icon(
                  Icons.search,
                  color: context.colors.onPrimary,
                ),
                hint: "Search",
                background: context.colors.grey.withOpacity(0.4),
              ),
              20.kh,
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: roles.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: Key(roles[index]),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        secondaryBackground: Container(
                          color: context.colors.greenHeadline,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.edit, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          if(direction==DismissDirection.startToEnd){
                            setState(() {
                              roles.removeAt(index);

                            });
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: "Edit role".s(20).w(600),
                                    actions: [
                                      CupertinoDialogAction(
                                        isDestructiveAction: false,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: "Cancel"
                                            .s(16)
                                            .w(400)
                                            .c(context.colors.lightBlue),
                                      ),
                                      CupertinoDialogAction(
                                        isDestructiveAction: false,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: "Edit"
                                            .s(16)
                                            .w(600)
                                            .c(context.colors.lightBlue),
                                      ),
                                    ],
                                    content: Material(
                                      borderRadius: BorderRadius.all(Radius.circular(16)),
                                      child: CommonTextField(
                                        hint: roles[index],
                                        background:
                                        context.colors.onPrimary,
                                      ),
                                    ),
                                  );
                                });
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Item dismissed')),
                          );
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: (index + 1).toString().s(15).c(Colors.white),
                          title: roles[index].s(16).c(Colors.white),
                          onTap: () {},
                        ),

                        );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
