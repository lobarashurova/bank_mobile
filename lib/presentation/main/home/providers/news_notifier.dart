import 'package:bank_mobile/data/api/news_api.dart';
import 'package:bank_mobile/data/api_model/news_model/news_model.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsProvider extends ChangeNotifier {
  final api = getIt<NewsAPi>();
  bool _isLoading = false;
  String? _errorMessage;
  List<NewsModel>? _newsList;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<NewsModel>? get newsList => _newsList;

  Future<bool> getAllNews() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.getAllNews();
      if (response.statusCode == 200) {
        _newsList = (response.data as List).map((e) {
          return NewsModel(
              id: e['id'],
              title: e['title'],
              text: e['description'],
              imageUrl: "https://solutionsquad.uz/${e['image']}");
        }).toList();
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

  Future<bool> createNews(String title, String text) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.createNews(title, text);
      if (response.statusCode == 200) {
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

  Future<bool> updateNews(NewsModel model) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response =
          await api.updateNews(model.title, model.text, model.id ?? 0);
      if (response.statusCode == 200) {
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

  Future<bool> deleteNews(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.deleteNews(id);
      if (response.statusCode == 200) {
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
