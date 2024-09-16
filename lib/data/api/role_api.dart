import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoleApi {
  final Dio _dio;

  RoleApi(this._dio);

  Future<Response> getRole() {
    return _dio.get("get-role");
  }
}
