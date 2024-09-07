import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmployeeApi {
  final Dio _dio;

  EmployeeApi(this._dio);

  Future<Response> getAllEmployees() {
    return _dio.get('get-employees-list');
  }

  Future<Response> getEmployee(int id) {
    return _dio.post('get-employee', data: {'employee_id': id});
  }

  Future<Response> createEmployee(UserModel userModel) {
    FormData formData = FormData.fromMap({
      "name": userModel.name,
      "username": userModel.username,
      "email": userModel.email,
      "password": userModel.name,
      "dob": userModel.dob,
      "phone_number": userModel.phoneNumber,
      "gender": userModel.gender,
      "address": userModel.address,
      "specialist": userModel.specialist,
      "role": "admin",
      "employee_year": userModel.employeeYear,
      "salary": userModel.salary,
    });
    return _dio.post('create-employee', data: formData);
  }

  Future<Response> updateEmployee(UserModel userModel) {
    FormData formData = FormData.fromMap({
      "name": userModel.name,
      "username": userModel.username,
      "email": userModel.email,
      "password": userModel.name,
      "dob": userModel.dob,
      "phone_number": userModel.phoneNumber,
      "gender": userModel.gender,
      "address": userModel.address,
      "specialist": userModel.specialist,
      "role": "admin",
      "employee_year": userModel.employeeYear,
      "salary": userModel.salary,
    });
    return _dio.post('update-employee', data: formData);
  }

  Future<Response> deleteEmployeeData(int id) {
    return _dio.post('delete-employee', data: {'id': id});
  }
}
