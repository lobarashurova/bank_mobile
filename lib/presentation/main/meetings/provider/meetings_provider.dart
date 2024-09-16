import 'package:bank_mobile/data/api/meeting_api.dart';
import 'package:bank_mobile/data/api_model/meeting_model/meeting_model.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MeetingsProvider extends ChangeNotifier {
  final api = getIt<MeetingApi>();
  final storage = getIt<Storage>();
  bool _isLoading = false;
  String? _errorMessage;
  List<MeetingData>? _meetings;
  MeetingData? _meeting;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<MeetingData>? get meetings => _meetings;

  MeetingData? get meeting => _meeting;

  Future<bool> getMeetings() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.getAllMeetings();

      if (response.statusCode == 200) {
        final data = (response.data['upcoming']['data'] as List);
        _meetings = (data).map((e) => MeetingData.fromJson(e)).toList();
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

  Future<bool> viewMeeting(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.viewMeetings(id);

      if (response.statusCode == 200) {
        final data = (response.data['meeting']['data']);
        _meeting = MeetingData.fromJson(data);
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
