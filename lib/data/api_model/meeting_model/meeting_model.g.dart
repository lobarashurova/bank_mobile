// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeetingModelImpl _$$MeetingModelImplFromJson(Map<String, dynamic> json) =>
    _$MeetingModelImpl(
      ongoing: json['ongoing'] == null
          ? null
          : Ongoing.fromJson(json['ongoing'] as Map<String, dynamic>),
      upcoming: json['upcoming'] == null
          ? null
          : UpComing.fromJson(json['upcoming'] as Map<String, dynamic>),
      past: json['past'] == null
          ? null
          : Ongoing.fromJson(json['past'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MeetingModelImplToJson(_$MeetingModelImpl instance) =>
    <String, dynamic>{
      'ongoing': instance.ongoing?.toJson(),
      'upcoming': instance.upcoming?.toJson(),
      'past': instance.past?.toJson(),
    };

_$OngoingImpl _$$OngoingImplFromJson(Map<String, dynamic> json) =>
    _$OngoingImpl(
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$OngoingImplToJson(_$OngoingImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$UpComingImpl _$$UpComingImplFromJson(Map<String, dynamic> json) =>
    _$UpComingImpl(
      status: (json['status'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MeetingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UpComingImplToJson(_$UpComingImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$MeetingDataImpl _$$MeetingDataImplFromJson(Map<String, dynamic> json) =>
    _$MeetingDataImpl(
      uuid: json['uuid'] as String?,
      id: (json['id'] as num?)?.toInt(),
      hostId: json['host_id'] as String?,
      hostEmail: json['host_email'] as String?,
      assistantId: json['assistant_id'] as String?,
      topic: json['topic'] as String?,
      type: (json['type'] as num?)?.toInt(),
      status: json['status'] as String?,
      startTime: json['start_time'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      timezone: json['timezone'] as String?,
      agenda: json['agenda'] as String?,
      createdAt: json['created_at'] as String?,
      startUrl: json['start_url'] as String?,
      joinUrl: json['join_url'] as String?,
      password: json['password'] as String?,
      h323Password: json['h323_password'] as String?,
      pstnPassword: json['pstn_password'] as String?,
      encryptedPassword: json['encrypted_password'] as String?,
      preSchedule: json['pre_schedule'] as bool?,
    );

Map<String, dynamic> _$$MeetingDataImplToJson(_$MeetingDataImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'host_id': instance.hostId,
      'host_email': instance.hostEmail,
      'assistant_id': instance.assistantId,
      'topic': instance.topic,
      'type': instance.type,
      'status': instance.status,
      'start_time': instance.startTime,
      'duration': instance.duration,
      'timezone': instance.timezone,
      'agenda': instance.agenda,
      'created_at': instance.createdAt,
      'start_url': instance.startUrl,
      'join_url': instance.joinUrl,
      'password': instance.password,
      'h323_password': instance.h323Password,
      'pstn_password': instance.pstnPassword,
      'encrypted_password': instance.encryptedPassword,
      'pre_schedule': instance.preSchedule,
    };
