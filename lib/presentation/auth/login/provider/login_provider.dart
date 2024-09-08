import 'package:bank_mobile/data/api/auth_api.dart';
import 'package:bank_mobile/data/module/base_models/tokens.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final api = getIt<AuthApi>();
  final storage = getIt<Storage>();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.loginUser(email, password);

      if (response.statusCode == 200) {
        print('Login successful');
        final token = response.data;
        storage.tokens.set(Tokens(
            refresh: token['refresh_token'], access: token['access_token']));
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
