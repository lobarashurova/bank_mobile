import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class MeetingApi {
  final Dio _dio;

  MeetingApi(this._dio);

  Future<Response> getAllMeetings() {
    return _dio.get("get-meetings");
  }

  Future<Response> viewMeetings(int id) {
    return _dio.get("view-meeting", data: {'meeting_id': id});
  }
}
