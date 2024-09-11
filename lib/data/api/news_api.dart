import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsAPi {
  final Dio _dio;

  NewsAPi(this._dio);

  Future<Response> getAllNews() {
    return _dio.get('get-news');
  }

  Future<Response> createNews(String title, String text) {
    return _dio.post('store-news',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: {'title': title, 'text': text});
  }

  Future<Response> updateNews(String title, String text, int id) {
    return _dio.post('update-news/$id',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: {'title': title, 'text': text});
  }

  Future<Response> deleteNews(int id) {
    return _dio.post(
      'delete-news/$id',
    );
  }
}
