// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmallUserModelImpl _$$SmallUserModelImplFromJson(Map<String, dynamic> json) =>
    _$SmallUserModelImpl(
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SmallUserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SmallUserModelImplToJson(
        _$SmallUserModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

_$SmallUserDataImpl _$$SmallUserDataImplFromJson(Map<String, dynamic> json) =>
    _$SmallUserDataImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      employeeYear: json['employee_year'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$SmallUserDataImplToJson(_$SmallUserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'employee_year': instance.employeeYear,
      'role': instance.role,
    };
