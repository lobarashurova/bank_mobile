import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthApi {
  final Dio _dio;

  AuthApi(this._dio);

  Future<Response> loginUser(String email, String password) {
    return _dio.post('login', data: {'email': email, 'password': password});
  }
}
