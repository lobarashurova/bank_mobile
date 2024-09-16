import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_model.freezed.dart';
part 'meeting_model.g.dart';

@freezed
class MeetingModel with _$MeetingModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory MeetingModel({
    Ongoing? ongoing,
    UpComing? upcoming,
    Ongoing? past,
  }) = _MeetingModel;

  factory MeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingModelFromJson(json);
}

@freezed
class Ongoing with _$Ongoing {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Ongoing({
    int? status,
    List<String>? data,
  }) = _Ongoing;

  factory Ongoing.fromJson(Map<String, dynamic> json) =>
      _$OngoingFromJson(json);
}

@freezed
class UpComing with _$UpComing {
  const factory UpComing({
    int? status,
    List<MeetingData>? data,
  }) = _UpComing;

  factory UpComing.fromJson(Map<String, dynamic> json) =>
      _$UpComingFromJson(json);
}

@freezed
class MeetingData with _$MeetingData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MeetingData({
    String? uuid,
    int? id,
    String? hostId,
    String? hostEmail,
    String? assistantId,
    String? topic,
    int? type,
    String? status,
    String? startTime,
    int? duration,
    String? timezone,
    String? agenda,
    String? createdAt,
    String? startUrl,
    String? joinUrl,
    String? password,
    String? h323Password,
    String? pstnPassword,
    String? encryptedPassword,
    bool? preSchedule,
  }) = _MeetingData;

  factory MeetingData.fromJson(Map<String, dynamic> json) =>
      _$MeetingDataFromJson(json);
}
