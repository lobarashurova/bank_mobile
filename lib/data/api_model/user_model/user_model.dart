import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    String? name,
    String? email,
    String? username,
    String? emailVerifiedAt,
    String? profilePhoto,
    String? dob,
    String? phoneNumber,
    String? gender,
    String? address,
    String? specialist,
    String? employeeYear,
    String? salary,
    String? createdAt,
    String? updatedAt,
    int? activeStatus,
    String? avatar,
    int? darkMode,
    String? messengerColor,
    String? refreshToken,

  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
