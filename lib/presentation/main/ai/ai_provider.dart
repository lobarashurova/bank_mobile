import 'package:bank_mobile/data/api/home_api.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/presentation/main/ai/ai_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AiProvider extends ChangeNotifier {
  final api = getIt<HomeApi>();
  bool _isLoading = false;
  String? _errorMessage;
  List<AiModel> _aiList = [];

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<AiModel> get aiList => _aiList;

  Future<void> postQuestion(String text) async {
    (_aiList).add(AiModel(true, text));

    print("text    $text");
    print("aiList lenght ${_aiList?.length}");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.postQuestion(text);
      if (response.statusCode == 200) {
        _isLoading = false;
        (_aiList ?? []).add(AiModel(false, response.data['content']));
        _aiList.reversed.toList();
        print("aiList lenght2 ${_aiList?.length}");
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
}
