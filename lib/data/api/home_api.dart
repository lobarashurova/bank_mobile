import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeApi {
  final Dio _dio;

  HomeApi(this._dio);

  Future<Response> getAllCategories() {
    return _dio.post('catalog/getAllCategories/');
  }

  Future<Response> getAllProducts() {
    return _dio.post('catalog/getAllProducts/');
  }

  Future<Response> getCategoriesById(int id) {
    return _dio.post('catalog/getAllProducts/', data: {"category_id": id});
  }

  Future<Response> getProductById(int id) {
    return _dio.post('catalog/getProductById/', data: {"product_id": id});
  }
}
