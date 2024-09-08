import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_user_model.freezed.dart';
part 'small_user_model.g.dart';

@freezed
class SmallUserModel with _$SmallUserModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SmallUserModel({
    int? status,
    List<SmallUserData>? data,
  }) = _SmallUserModel;

  factory SmallUserModel.fromJson(Map<String, dynamic> json) =>
      _$SmallUserModelFromJson(json);
}

@freezed
class SmallUserData with _$SmallUserData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)

  const factory SmallUserData({
    int? id,
    String? name,
    String? employeeYear,
    String? role,
  }) = _SmallUserData;

  factory SmallUserData.fromJson(Map<String, dynamic> json) =>
      _$SmallUserDataFromJson(json);
}
