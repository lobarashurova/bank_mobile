// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      profilePhoto: json['profile_photo'] as String?,
      dob: json['dob'] as String?,
      phoneNumber: json['phone_number'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      specialist: json['specialist'] as String?,
      employeeYear: json['employee_year'] as String?,
      salary: json['salary'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      activeStatus: (json['active_status'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      darkMode: (json['dark_mode'] as num?)?.toInt(),
      messengerColor: json['messenger_color'] as String?,
      refreshToken: json['refresh_token'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'email_verified_at': instance.emailVerifiedAt,
      'profile_photo': instance.profilePhoto,
      'dob': instance.dob,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
      'gender': instance.gender,
      'address': instance.address,
      'specialist': instance.specialist,
      'employee_year': instance.employeeYear,
      'salary': instance.salary,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'active_status': instance.activeStatus,
      'avatar': instance.avatar,
      'dark_mode': instance.darkMode,
      'messenger_color': instance.messengerColor,
      'refresh_token': instance.refreshToken,
      'role': instance.role,
    };
