// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeetingModel _$MeetingModelFromJson(Map<String, dynamic> json) {
  return _MeetingModel.fromJson(json);
}

/// @nodoc
mixin _$MeetingModel {
  Ongoing? get ongoing => throw _privateConstructorUsedError;
  UpComing? get upcoming => throw _privateConstructorUsedError;
  Ongoing? get past => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeetingModelCopyWith<MeetingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingModelCopyWith<$Res> {
  factory $MeetingModelCopyWith(
          MeetingModel value, $Res Function(MeetingModel) then) =
      _$MeetingModelCopyWithImpl<$Res, MeetingModel>;
  @useResult
  $Res call({Ongoing? ongoing, UpComing? upcoming, Ongoing? past});

  $OngoingCopyWith<$Res>? get ongoing;
  $UpComingCopyWith<$Res>? get upcoming;
  $OngoingCopyWith<$Res>? get past;
}

/// @nodoc
class _$MeetingModelCopyWithImpl<$Res, $Val extends MeetingModel>
    implements $MeetingModelCopyWith<$Res> {
  _$MeetingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ongoing = freezed,
    Object? upcoming = freezed,
    Object? past = freezed,
  }) {
    return _then(_value.copyWith(
      ongoing: freezed == ongoing
          ? _value.ongoing
          : ongoing // ignore: cast_nullable_to_non_nullable
              as Ongoing?,
      upcoming: freezed == upcoming
          ? _value.upcoming
          : upcoming // ignore: cast_nullable_to_non_nullable
              as UpComing?,
      past: freezed == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as Ongoing?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OngoingCopyWith<$Res>? get ongoing {
    if (_value.ongoing == null) {
      return null;
    }

    return $OngoingCopyWith<$Res>(_value.ongoing!, (value) {
      return _then(_value.copyWith(ongoing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpComingCopyWith<$Res>? get upcoming {
    if (_value.upcoming == null) {
      return null;
    }

    return $UpComingCopyWith<$Res>(_value.upcoming!, (value) {
      return _then(_value.copyWith(upcoming: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OngoingCopyWith<$Res>? get past {
    if (_value.past == null) {
      return null;
    }

    return $OngoingCopyWith<$Res>(_value.past!, (value) {
      return _then(_value.copyWith(past: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeetingModelImplCopyWith<$Res>
    implements $MeetingModelCopyWith<$Res> {
  factory _$$MeetingModelImplCopyWith(
          _$MeetingModelImpl value, $Res Function(_$MeetingModelImpl) then) =
      __$$MeetingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ongoing? ongoing, UpComing? upcoming, Ongoing? past});

  @override
  $OngoingCopyWith<$Res>? get ongoing;
  @override
  $UpComingCopyWith<$Res>? get upcoming;
  @override
  $OngoingCopyWith<$Res>? get past;
}

/// @nodoc
class __$$MeetingModelImplCopyWithImpl<$Res>
    extends _$MeetingModelCopyWithImpl<$Res, _$MeetingModelImpl>
    implements _$$MeetingModelImplCopyWith<$Res> {
  __$$MeetingModelImplCopyWithImpl(
      _$MeetingModelImpl _value, $Res Function(_$MeetingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ongoing = freezed,
    Object? upcoming = freezed,
    Object? past = freezed,
  }) {
    return _then(_$MeetingModelImpl(
      ongoing: freezed == ongoing
          ? _value.ongoing
          : ongoing // ignore: cast_nullable_to_non_nullable
              as Ongoing?,
      upcoming: freezed == upcoming
          ? _value.upcoming
          : upcoming // ignore: cast_nullable_to_non_nullable
              as UpComing?,
      past: freezed == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as Ongoing?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$MeetingModelImpl implements _MeetingModel {
  const _$MeetingModelImpl({this.ongoing, this.upcoming, this.past});

  factory _$MeetingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeetingModelImplFromJson(json);

  @override
  final Ongoing? ongoing;
  @override
  final UpComing? upcoming;
  @override
  final Ongoing? past;

  @override
  String toString() {
    return 'MeetingModel(ongoing: $ongoing, upcoming: $upcoming, past: $past)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingModelImpl &&
            (identical(other.ongoing, ongoing) || other.ongoing == ongoing) &&
            (identical(other.upcoming, upcoming) ||
                other.upcoming == upcoming) &&
            (identical(other.past, past) || other.past == past));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ongoing, upcoming, past);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingModelImplCopyWith<_$MeetingModelImpl> get copyWith =>
      __$$MeetingModelImplCopyWithImpl<_$MeetingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeetingModelImplToJson(
      this,
    );
  }
}

abstract class _MeetingModel implements MeetingModel {
  const factory _MeetingModel(
      {final Ongoing? ongoing,
      final UpComing? upcoming,
      final Ongoing? past}) = _$MeetingModelImpl;

  factory _MeetingModel.fromJson(Map<String, dynamic> json) =
      _$MeetingModelImpl.fromJson;

  @override
  Ongoing? get ongoing;
  @override
  UpComing? get upcoming;
  @override
  Ongoing? get past;
  @override
  @JsonKey(ignore: true)
  _$$MeetingModelImplCopyWith<_$MeetingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ongoing _$OngoingFromJson(Map<String, dynamic> json) {
  return _Ongoing.fromJson(json);
}

/// @nodoc
mixin _$Ongoing {
  int? get status => throw _privateConstructorUsedError;
  List<String>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OngoingCopyWith<Ongoing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OngoingCopyWith<$Res> {
  factory $OngoingCopyWith(Ongoing value, $Res Function(Ongoing) then) =
      _$OngoingCopyWithImpl<$Res, Ongoing>;
  @useResult
  $Res call({int? status, List<String>? data});
}

/// @nodoc
class _$OngoingCopyWithImpl<$Res, $Val extends Ongoing>
    implements $OngoingCopyWith<$Res> {
  _$OngoingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OngoingImplCopyWith<$Res> implements $OngoingCopyWith<$Res> {
  factory _$$OngoingImplCopyWith(
          _$OngoingImpl value, $Res Function(_$OngoingImpl) then) =
      __$$OngoingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<String>? data});
}

/// @nodoc
class __$$OngoingImplCopyWithImpl<$Res>
    extends _$OngoingCopyWithImpl<$Res, _$OngoingImpl>
    implements _$$OngoingImplCopyWith<$Res> {
  __$$OngoingImplCopyWithImpl(
      _$OngoingImpl _value, $Res Function(_$OngoingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$OngoingImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$OngoingImpl implements _Ongoing {
  const _$OngoingImpl({this.status, final List<String>? data}) : _data = data;

  factory _$OngoingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OngoingImplFromJson(json);

  @override
  final int? status;
  final List<String>? _data;
  @override
  List<String>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Ongoing(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OngoingImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OngoingImplCopyWith<_$OngoingImpl> get copyWith =>
      __$$OngoingImplCopyWithImpl<_$OngoingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OngoingImplToJson(
      this,
    );
  }
}

abstract class _Ongoing implements Ongoing {
  const factory _Ongoing({final int? status, final List<String>? data}) =
      _$OngoingImpl;

  factory _Ongoing.fromJson(Map<String, dynamic> json) = _$OngoingImpl.fromJson;

  @override
  int? get status;
  @override
  List<String>? get data;
  @override
  @JsonKey(ignore: true)
  _$$OngoingImplCopyWith<_$OngoingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpComing _$UpComingFromJson(Map<String, dynamic> json) {
  return _UpComing.fromJson(json);
}

/// @nodoc
mixin _$UpComing {
  int? get status => throw _privateConstructorUsedError;
  List<MeetingData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpComingCopyWith<UpComing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpComingCopyWith<$Res> {
  factory $UpComingCopyWith(UpComing value, $Res Function(UpComing) then) =
      _$UpComingCopyWithImpl<$Res, UpComing>;
  @useResult
  $Res call({int? status, List<MeetingData>? data});
}

/// @nodoc
class _$UpComingCopyWithImpl<$Res, $Val extends UpComing>
    implements $UpComingCopyWith<$Res> {
  _$UpComingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MeetingData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpComingImplCopyWith<$Res>
    implements $UpComingCopyWith<$Res> {
  factory _$$UpComingImplCopyWith(
          _$UpComingImpl value, $Res Function(_$UpComingImpl) then) =
      __$$UpComingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<MeetingData>? data});
}

/// @nodoc
class __$$UpComingImplCopyWithImpl<$Res>
    extends _$UpComingCopyWithImpl<$Res, _$UpComingImpl>
    implements _$$UpComingImplCopyWith<$Res> {
  __$$UpComingImplCopyWithImpl(
      _$UpComingImpl _value, $Res Function(_$UpComingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UpComingImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MeetingData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpComingImpl implements _UpComing {
  const _$UpComingImpl({this.status, final List<MeetingData>? data})
      : _data = data;

  factory _$UpComingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpComingImplFromJson(json);

  @override
  final int? status;
  final List<MeetingData>? _data;
  @override
  List<MeetingData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UpComing(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpComingImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpComingImplCopyWith<_$UpComingImpl> get copyWith =>
      __$$UpComingImplCopyWithImpl<_$UpComingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpComingImplToJson(
      this,
    );
  }
}

abstract class _UpComing implements UpComing {
  const factory _UpComing({final int? status, final List<MeetingData>? data}) =
      _$UpComingImpl;

  factory _UpComing.fromJson(Map<String, dynamic> json) =
      _$UpComingImpl.fromJson;

  @override
  int? get status;
  @override
  List<MeetingData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$UpComingImplCopyWith<_$UpComingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MeetingData _$MeetingDataFromJson(Map<String, dynamic> json) {
  return _MeetingData.fromJson(json);
}

/// @nodoc
mixin _$MeetingData {
  String? get uuid => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get hostId => throw _privateConstructorUsedError;
  String? get hostEmail => throw _privateConstructorUsedError;
  String? get assistantId => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  String? get agenda => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get startUrl => throw _privateConstructorUsedError;
  String? get joinUrl => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get h323Password => throw _privateConstructorUsedError;
  String? get pstnPassword => throw _privateConstructorUsedError;
  String? get encryptedPassword => throw _privateConstructorUsedError;
  bool? get preSchedule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeetingDataCopyWith<MeetingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingDataCopyWith<$Res> {
  factory $MeetingDataCopyWith(
          MeetingData value, $Res Function(MeetingData) then) =
      _$MeetingDataCopyWithImpl<$Res, MeetingData>;
  @useResult
  $Res call(
      {String? uuid,
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
      bool? preSchedule});
}

/// @nodoc
class _$MeetingDataCopyWithImpl<$Res, $Val extends MeetingData>
    implements $MeetingDataCopyWith<$Res> {
  _$MeetingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? id = freezed,
    Object? hostId = freezed,
    Object? hostEmail = freezed,
    Object? assistantId = freezed,
    Object? topic = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? startTime = freezed,
    Object? duration = freezed,
    Object? timezone = freezed,
    Object? agenda = freezed,
    Object? createdAt = freezed,
    Object? startUrl = freezed,
    Object? joinUrl = freezed,
    Object? password = freezed,
    Object? h323Password = freezed,
    Object? pstnPassword = freezed,
    Object? encryptedPassword = freezed,
    Object? preSchedule = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      hostId: freezed == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostEmail: freezed == hostEmail
          ? _value.hostEmail
          : hostEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      assistantId: freezed == assistantId
          ? _value.assistantId
          : assistantId // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      agenda: freezed == agenda
          ? _value.agenda
          : agenda // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      startUrl: freezed == startUrl
          ? _value.startUrl
          : startUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinUrl: freezed == joinUrl
          ? _value.joinUrl
          : joinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      h323Password: freezed == h323Password
          ? _value.h323Password
          : h323Password // ignore: cast_nullable_to_non_nullable
              as String?,
      pstnPassword: freezed == pstnPassword
          ? _value.pstnPassword
          : pstnPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedPassword: freezed == encryptedPassword
          ? _value.encryptedPassword
          : encryptedPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      preSchedule: freezed == preSchedule
          ? _value.preSchedule
          : preSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeetingDataImplCopyWith<$Res>
    implements $MeetingDataCopyWith<$Res> {
  factory _$$MeetingDataImplCopyWith(
          _$MeetingDataImpl value, $Res Function(_$MeetingDataImpl) then) =
      __$$MeetingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
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
      bool? preSchedule});
}

/// @nodoc
class __$$MeetingDataImplCopyWithImpl<$Res>
    extends _$MeetingDataCopyWithImpl<$Res, _$MeetingDataImpl>
    implements _$$MeetingDataImplCopyWith<$Res> {
  __$$MeetingDataImplCopyWithImpl(
      _$MeetingDataImpl _value, $Res Function(_$MeetingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? id = freezed,
    Object? hostId = freezed,
    Object? hostEmail = freezed,
    Object? assistantId = freezed,
    Object? topic = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? startTime = freezed,
    Object? duration = freezed,
    Object? timezone = freezed,
    Object? agenda = freezed,
    Object? createdAt = freezed,
    Object? startUrl = freezed,
    Object? joinUrl = freezed,
    Object? password = freezed,
    Object? h323Password = freezed,
    Object? pstnPassword = freezed,
    Object? encryptedPassword = freezed,
    Object? preSchedule = freezed,
  }) {
    return _then(_$MeetingDataImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      hostId: freezed == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String?,
      hostEmail: freezed == hostEmail
          ? _value.hostEmail
          : hostEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      assistantId: freezed == assistantId
          ? _value.assistantId
          : assistantId // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      agenda: freezed == agenda
          ? _value.agenda
          : agenda // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      startUrl: freezed == startUrl
          ? _value.startUrl
          : startUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinUrl: freezed == joinUrl
          ? _value.joinUrl
          : joinUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      h323Password: freezed == h323Password
          ? _value.h323Password
          : h323Password // ignore: cast_nullable_to_non_nullable
              as String?,
      pstnPassword: freezed == pstnPassword
          ? _value.pstnPassword
          : pstnPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedPassword: freezed == encryptedPassword
          ? _value.encryptedPassword
          : encryptedPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      preSchedule: freezed == preSchedule
          ? _value.preSchedule
          : preSchedule // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MeetingDataImpl implements _MeetingData {
  const _$MeetingDataImpl(
      {this.uuid,
      this.id,
      this.hostId,
      this.hostEmail,
      this.assistantId,
      this.topic,
      this.type,
      this.status,
      this.startTime,
      this.duration,
      this.timezone,
      this.agenda,
      this.createdAt,
      this.startUrl,
      this.joinUrl,
      this.password,
      this.h323Password,
      this.pstnPassword,
      this.encryptedPassword,
      this.preSchedule});

  factory _$MeetingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeetingDataImplFromJson(json);

  @override
  final String? uuid;
  @override
  final int? id;
  @override
  final String? hostId;
  @override
  final String? hostEmail;
  @override
  final String? assistantId;
  @override
  final String? topic;
  @override
  final int? type;
  @override
  final String? status;
  @override
  final String? startTime;
  @override
  final int? duration;
  @override
  final String? timezone;
  @override
  final String? agenda;
  @override
  final String? createdAt;
  @override
  final String? startUrl;
  @override
  final String? joinUrl;
  @override
  final String? password;
  @override
  final String? h323Password;
  @override
  final String? pstnPassword;
  @override
  final String? encryptedPassword;
  @override
  final bool? preSchedule;

  @override
  String toString() {
    return 'MeetingData(uuid: $uuid, id: $id, hostId: $hostId, hostEmail: $hostEmail, assistantId: $assistantId, topic: $topic, type: $type, status: $status, startTime: $startTime, duration: $duration, timezone: $timezone, agenda: $agenda, createdAt: $createdAt, startUrl: $startUrl, joinUrl: $joinUrl, password: $password, h323Password: $h323Password, pstnPassword: $pstnPassword, encryptedPassword: $encryptedPassword, preSchedule: $preSchedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingDataImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.hostEmail, hostEmail) ||
                other.hostEmail == hostEmail) &&
            (identical(other.assistantId, assistantId) ||
                other.assistantId == assistantId) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.agenda, agenda) || other.agenda == agenda) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startUrl, startUrl) ||
                other.startUrl == startUrl) &&
            (identical(other.joinUrl, joinUrl) || other.joinUrl == joinUrl) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.h323Password, h323Password) ||
                other.h323Password == h323Password) &&
            (identical(other.pstnPassword, pstnPassword) ||
                other.pstnPassword == pstnPassword) &&
            (identical(other.encryptedPassword, encryptedPassword) ||
                other.encryptedPassword == encryptedPassword) &&
            (identical(other.preSchedule, preSchedule) ||
                other.preSchedule == preSchedule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uuid,
        id,
        hostId,
        hostEmail,
        assistantId,
        topic,
        type,
        status,
        startTime,
        duration,
        timezone,
        agenda,
        createdAt,
        startUrl,
        joinUrl,
        password,
        h323Password,
        pstnPassword,
        encryptedPassword,
        preSchedule
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingDataImplCopyWith<_$MeetingDataImpl> get copyWith =>
      __$$MeetingDataImplCopyWithImpl<_$MeetingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeetingDataImplToJson(
      this,
    );
  }
}

abstract class _MeetingData implements MeetingData {
  const factory _MeetingData(
      {final String? uuid,
      final int? id,
      final String? hostId,
      final String? hostEmail,
      final String? assistantId,
      final String? topic,
      final int? type,
      final String? status,
      final String? startTime,
      final int? duration,
      final String? timezone,
      final String? agenda,
      final String? createdAt,
      final String? startUrl,
      final String? joinUrl,
      final String? password,
      final String? h323Password,
      final String? pstnPassword,
      final String? encryptedPassword,
      final bool? preSchedule}) = _$MeetingDataImpl;

  factory _MeetingData.fromJson(Map<String, dynamic> json) =
      _$MeetingDataImpl.fromJson;

  @override
  String? get uuid;
  @override
  int? get id;
  @override
  String? get hostId;
  @override
  String? get hostEmail;
  @override
  String? get assistantId;
  @override
  String? get topic;
  @override
  int? get type;
  @override
  String? get status;
  @override
  String? get startTime;
  @override
  int? get duration;
  @override
  String? get timezone;
  @override
  String? get agenda;
  @override
  String? get createdAt;
  @override
  String? get startUrl;
  @override
  String? get joinUrl;
  @override
  String? get password;
  @override
  String? get h323Password;
  @override
  String? get pstnPassword;
  @override
  String? get encryptedPassword;
  @override
  bool? get preSchedule;
  @override
  @JsonKey(ignore: true)
  _$$MeetingDataImplCopyWith<_$MeetingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
