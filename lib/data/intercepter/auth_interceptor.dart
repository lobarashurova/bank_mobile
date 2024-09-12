import 'dart:io';

import 'package:bank_mobile/data/constants/Constants.dart';
import 'package:bank_mobile/data/module/base_models/tokens.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/web.dart';

@lazySingleton
class AuthInterceptor extends QueuedInterceptor {
  final Storage _storage;
  final Logger log;

  AuthInterceptor(this._storage, this.log);

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler,) async {
    final tokens = _storage.tokens.call();

    if (tokens == null) return handler.next(options);

    String? access = tokens.access;
    if (access == null) {
      return handler.reject(DioException(requestOptions: options), true);
    }
    print("access token $access =============\n=========");

    // if (JwtDecoder.isExpired(access)) {
    //   access = await refreshToken(tokens.refresh!);
    // }

    options.headers.addAll({'Authorization': 'Bearer $access'});

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await refreshToken(_storage.tokens
          .call()
          ?.refresh ?? "");

    }
  }

  Future<String?> refreshToken(String refresh) async {
    try {
      final dio = Dio();
      dio.options.baseUrl = Constants.baseUrl;

      final request = {'refresh': refresh};
      final response =
      await dio.post('refresh-token', data: request);

      final tokens = Tokens(refresh: refresh, access: response.data['access']);
      await _storage.tokens.set(tokens);
      return tokens.access;
    } catch (e, stackTrace) {
      if (e != SocketException) {
        await _storage.tokens.set(null);
      } else {
        await _storage.tokens.set(null);
      }
      log.e("My expetiosn:::::${e.toString()}",
          error: e, stackTrace: stackTrace);

      return null;
    }
  }
}
