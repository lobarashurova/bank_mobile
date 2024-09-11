import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmployeeApi {
  final Dio _dio;

  EmployeeApi(this._dio);

  Future<Response> getAllEmployees() {
    return _dio.get('get-employee-list');
  }

  Future<Response> getEmployee(int id) {
    return _dio.post('get-employee', data: {'employee_id': id});
  }

  Future<Response> createEmployee(UserModel userModel) async {
    FormData formData = FormData.fromMap({
      "name": userModel.name,
      "username": userModel.username,
      "email": userModel.email,
      "password": userModel.password,
      "dob": userModel.dob,
      "phone_number": userModel.phoneNumber,
      "gender": userModel.gender,
      "address": userModel.address,
      "specialist": userModel.specialist,
      "role": userModel.role,
      "employee_year": userModel.employeeYear,
      "salary": userModel.salary,
    });
    if (userModel.profilePhoto != null) {
      formData.files.add(
        MapEntry(
          'profile_photo',
          await MultipartFile.fromFile((userModel.profilePhoto ?? ""),
              filename: (userModel.profilePhoto ?? "").split("/").last),
        ),
      );
    }

    return _dio.post('create-employee', data: formData);
  }

  Future<Response> updateEmployee(UserModel userModel) async {
    print("password : ${userModel.password}");
    FormData formData = FormData.fromMap({
      'employee_id ': userModel.id,
      "name": userModel.name,
      "username": userModel.username,
      "email": userModel.email,
      "dob": userModel.dob,
      "phone_number": userModel.phoneNumber,
      "gender": userModel.gender,
      "address": userModel.address,
      "specialist": userModel.specialist,
      "role": userModel.role,
      "employee_year": userModel.employeeYear,
      "salary": userModel.salary,
    });
    if (userModel.profilePhoto != null) {
      formData.files.add(
        MapEntry(
          'profile_photo',
          await MultipartFile.fromFile((userModel.profilePhoto ?? ""),
              filename: (userModel.profilePhoto ?? "").split("/").last),
        ),
      );
    }

    return _dio.post('update-employee', data: formData);
  }

  Future<Response> deleteEmployeeData(int id) {
    return _dio.post('delete-employee', data: {'employee_id': id});
  }

  Future<Response> getAllRoles() {
    return _dio.get('get-role');
  }

  Future<Response> getUser() {
    return _dio.get('get-user');
  }
}
