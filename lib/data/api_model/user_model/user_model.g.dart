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
      emailVerifiedAt: json['emailVerifiedAt'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      dob: json['dob'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      specialist: json['specialist'] as String?,
      employeeYear: json['employeeYear'] as String?,
      salary: json['salary'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      activeStatus: (json['activeStatus'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      darkMode: (json['darkMode'] as num?)?.toInt(),
      messengerColor: json['messengerColor'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'profilePhoto': instance.profilePhoto,
      'dob': instance.dob,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'address': instance.address,
      'specialist': instance.specialist,
      'employeeYear': instance.employeeYear,
      'salary': instance.salary,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'activeStatus': instance.activeStatus,
      'avatar': instance.avatar,
      'darkMode': instance.darkMode,
      'messengerColor': instance.messengerColor,
      'refreshToken': instance.refreshToken,
    };
