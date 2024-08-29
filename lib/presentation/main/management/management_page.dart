import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/presentation/main/management/role/role_info.dart';
import 'package:flutter/material.dart';

import 'employee/employees_info.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: "Employee managment".s(18),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                title: "Employee info".s(16).c(Colors.white),
                trailing: const Icon(
                  Icons.navigate_next_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EmployeesInfo()));
                },
              ),
              Divider(
                color: context.colors.display,
                thickness: 1,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
                title: "Role info".s(16).c(Colors.white),
                trailing: const Icon(
                  Icons.navigate_next_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoleInfo()));
                },
              ),
              Divider(
                color: context.colors.display,
                thickness: 1,
              ),
            ],
          ),
        ));
  }
}
