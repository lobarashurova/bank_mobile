import 'package:bank_mobile/data/api/employee_api.dart';
import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllEmployeesProvider extends ChangeNotifier {
  final api = getIt<EmployeeApi>();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> getAllEmployees() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.getAllEmployees();

      if (response.statusCode == 200) {
        print('Login successful');
        final token = response.data;
      } else {
        _errorMessage = 'Login failed';
      }
    } on DioException catch (e) {
      _errorMessage = e.response?.data['message'] ?? 'An error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> createEmployee(UserModel userModel) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.createEmployee(userModel);
      if (response.statusCode == 200) {
        print('user created successfully');
        return true;
      } else {
        _errorMessage = 'Login failed';
      }
    } on DioException catch (e) {
      _errorMessage = e.response?.data['message'] ?? 'An error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return false;
  }

  Future<bool> updateEmployeeData(UserModel userModel) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.updateEmployee(userModel);
      if (response.statusCode == 200) {
        return true;
        print('user updated successfully');
      } else {
        _errorMessage = 'Login failed';
      }
    } on DioException catch (e) {
      _errorMessage = e.response?.data['message'] ?? 'An error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return false;
  }

  Future<bool> deleteEmployeeData(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.deleteEmployeeData(id);
      if (response.statusCode == 200) {
        print('deleted successfully');
        return true;
      } else {
        _errorMessage = 'Login failed';
      }
    } on DioException catch (e) {
      _errorMessage = e.response?.data['message'] ?? 'An error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return false;
  }
}
