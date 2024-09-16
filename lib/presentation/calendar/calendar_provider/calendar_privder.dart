import 'dart:convert';

import 'package:bank_mobile/data/api/auth_api.dart';
import 'package:bank_mobile/data/module/injection.dart';
import 'package:bank_mobile/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/api_model/event_model/event_model.dart';

class CalendarProvider extends ChangeNotifier {
  final api = getIt<AuthApi>();
  final storage = getIt<Storage>();
  bool _isLoading = false;
  String? _errorMessage;
  List<EventModel>? _events;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<EventModel>? get events => _events;

  Future<bool> getEvents(String selectedDay) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    print("selected day : $selectedDay===================");
    try {
      final response = await api.getEvent(selectedDay);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data as Map<String, dynamic>;
        if (data.containsKey(selectedDay)) {
          _events = (data[selectedDay] as List)
              .map((eventData) => EventModel.fromJson(eventData))
              .toList();
        }
        _isLoading = false;
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

  Future<bool> getEventsForRange(String selectedDay) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.getEvent(selectedDay);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.data);
        if (data.containsKey(selectedDay)) {
          _events = (data[selectedDay] as List)
              .map((eventData) => EventModel.fromJson(eventData))
              .toList();
        }
        _isLoading = false;
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

  Future<bool> createEvent(String startDate, String endDate, String title,
      String describtion) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response =
          await api.createMeeting(title, describtion, startDate, endDate);

      if (response.statusCode == 200) {
        _isLoading = false;
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

  Future<bool> updateEvent(String startDate, String endDate, int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.updateMeeting(id, startDate, endDate);

      if (response.statusCode == 200) {
        _isLoading = false;
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

  Future<bool> deleteEvent(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await api.deleteEvent(id);

      if (response.statusCode == 200) {
        _isLoading = false;
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
