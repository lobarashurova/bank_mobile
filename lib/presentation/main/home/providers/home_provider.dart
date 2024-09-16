import 'package:bank_mobile/data/api/auth_api.dart';
import 'package:bank_mobile/data/api/employee_api.dart';
import 'package:bank_mobile/data/api_model/role_model/role_model.dart';
import 'package:bank_mobile/data/api_model/user_model/user_model.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier {
  final api = getIt<EmployeeApi>();
  final _api = getIt<AuthApi>();
  final _storage = getIt<Storage>();
  bool _isLoading = false;
  String? _errorMessage;
  UserModel? _user;
  List<RoleModel>? _roleModel;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  UserModel? get user => _user;

  List<RoleModel>? get roleModel => _roleModel;

  Future<void> getUserData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.getUser();
      if (response.statusCode == 200) {
        final UserModel myList =
            UserModel.fromJson(response.data as Map<String, dynamic>);
        _storage.role.set(myList.role);
        _storage.userId.set(myList.id);
        _storage.username.set(myList.username);
        _user = myList;
        _isLoading = false;
        notifyListeners();
      } else {
        _errorMessage = 'Login failed';
        _isLoading = false;
      }
    } on DioException catch (e) {
      _errorMessage = e.response?.data['message'] ?? 'An error occurred';
      _isLoading = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> getAllRoles() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.getAllRoles();
      if (response.statusCode == 200) {
        _roleModel = ((response.data as Map<String, dynamic>)['data'] as List)
            .map((e) => RoleModel.fromJson(e))
            .toList();
        notifyListeners();
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

  Future<bool> updateProfile(UserModel userModel) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.updateProfile(userModel);
      if (response.statusCode == 200) {
        _isLoading = false;
        notifyListeners();
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

  Future<bool> updatePassword(String oldPassword, String newPassword) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _api.updatePassword(oldPassword, newPassword);
      if (response.statusCode == 200) {
        _isLoading = false;
        notifyListeners();
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
