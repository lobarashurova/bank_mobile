import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:bank_mobile/extensions/snackbar_extensions.dart';
import 'package:bank_mobile/extensions/text_extensions.dart';
import 'package:bank_mobile/extensions/theme_extensions.dart';
import 'package:bank_mobile/extensions/widget.dart';
import 'package:bank_mobile/presentation/main/home/data/employee_class.dart';
import 'package:bank_mobile/presentation/main/management/employee/create_employee.dart';
import 'package:bank_mobile/presentation/main/management/employee_providers/all_employees_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/common/widgets/common_text_filed.dart';
import 'edit_employees.dart';

class EmployeesInfo extends StatefulWidget {
  const EmployeesInfo({super.key});

  @override
  State<EmployeesInfo> createState() => _EmployeesInfoState();
}

class _EmployeesInfoState extends State<EmployeesInfo> {
  List<EmployeeClass> employees = [
    EmployeeClass("Dilnoza Nishanova", "10-07-2005", "+998 94 652 75 88",
        "Project manager", "01-07-2024", 1500000),
    EmployeeClass("Fotima Rustamova", "18-05-2009", "+998 90 959 93 19",
        "Flutter Developer", "01-07-2024", 2000000),
  ];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<AllEmployeesProvider>(context, listen: false)
          .getAllEmployees();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Employee info".s(18),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateEmployee()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
              16.kh,
              Consumer<AllEmployeesProvider>(
                builder: (context, provider, child) {
                  return provider.isLoading == false
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: (provider.userList ?? []).length,
                          itemBuilder: (listContext, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "${index + 1}".s(12).c(Colors.white),
                                      ((provider.userList ?? [])[index].name ??
                                              "")
                                          .s(12)
                                          .c(Colors.white),
                                      ((provider.userList ?? [])[index]
                                                  .employeeYear ??
                                              "")
                                          .s(12)
                                          .c(Colors.white),
                                      ((provider.userList ?? [])[index].role ??
                                              '')
                                          .s(12)
                                          .c(Colors.white),
                                      PopupMenuButton<int>(
                                        iconColor: Colors.white,
                                        onSelected: (int result) {
                                          setState(() {});
                                        },
                                        itemBuilder:
                                            (BuildContext dialogContext) =>
                                                <PopupMenuEntry<int>>[
                                          PopupMenuItem<int>(
                                            value: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                "Edit".s(15),
                                                const Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                            onTap: () async {
                                              final success = await provider
                                                  .getEmployeeById(
                                                      (provider.userList ??
                                                                  [])[index]
                                                              .id ??
                                                          0);
                                              if (success) {
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => EditeEmployees(
                                                        userModel: (provider
                                                                    .user ??
                                                                UserModel())
                                                            .copyWith(
                                                                id: (provider.userList ??
                                                                            [])[
                                                                        index]
                                                                    .id))));
                                              }
                                            },
                                          ),
                                          PopupMenuItem<int>(
                                            value: 2,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  "Delete".s(15),
                                                  const Icon(
                                                    Icons.delete,
                                                    size: 20,
                                                  ),
                                                ]),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                    dialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        'Delete Employee'.s(18),
                                                    content:
                                                        'Do you want to delete employee'
                                                            .s(16),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: 'Cancel'.s(16),
                                                        onPressed: () {
                                                          Navigator.of(
                                                                  dialogContext)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: 'OK'.s(16),
                                                        onPressed: () async {
                                                          final status = await provider
                                                              .deleteEmployeeData(
                                                                  (provider.userList ??
                                                                              [])[index]
                                                                          .id ??
                                                                      0);
                                                          if (status) {
                                                            Navigator.of(
                                                                    dialogContext)
                                                                .pop();
                                                            context.showBeautifulSnackbar(
                                                                message:
                                                                    "Successfully deleted!");
                                                            provider
                                                                .getAllEmployees();
                                                          } else {
                                                            Navigator.of(
                                                                    dialogContext)
                                                                .pop();
                                                            context.showBeautifulSnackbar(
                                                                message:
                                                                    "Something went wrong");
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                )
                              ],
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: context.colors.onPrimary,
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
