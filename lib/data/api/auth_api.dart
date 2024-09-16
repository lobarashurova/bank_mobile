import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthApi {
  final Dio _dio;
  final Storage storage = getIt<Storage>();

  AuthApi(this._dio);

  Future<Response> loginUser(String email, String password) {
    return _dio.post('login', data: {'email': email, 'password': password});
  }

  Future<Response> createMeeting(
      String title, String describtion, String start, String end) {
    return _dio.post(
      'store-events/${storage.userId.call()}',
      data: {
        'title': title,
        'description': describtion,
        'start': start,
        'end': end
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
  }

  Future<Response> getEvent(String day) {
    return _dio.get(
      'get-events/5',
    );
  }

  Future<Response> updateMeeting(int id, String start, String end) {
    return _dio.post(
      'update-events/$id',
      data: {'start': start, 'end': end},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
  }

  Future<Response> updatePassword(String oldPassword, String newPassword) {
    return _dio.post('update-password/${storage.userId.call()}',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: {
          'old_password': oldPassword,
          'password': newPassword,
          'password_confirmation': newPassword
        });
  }

  Future<Response> deleteEvent(int id) {
    return _dio.post('delete-events/$id');
  }
}
