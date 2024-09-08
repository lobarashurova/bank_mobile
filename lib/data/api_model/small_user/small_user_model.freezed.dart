// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'small_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmallUserModel _$SmallUserModelFromJson(Map<String, dynamic> json) {
  return _SmallUserModel.fromJson(json);
}

/// @nodoc
mixin _$SmallUserModel {
  int? get status => throw _privateConstructorUsedError;
  List<SmallUserData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmallUserModelCopyWith<SmallUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmallUserModelCopyWith<$Res> {
  factory $SmallUserModelCopyWith(
          SmallUserModel value, $Res Function(SmallUserModel) then) =
      _$SmallUserModelCopyWithImpl<$Res, SmallUserModel>;
  @useResult
  $Res call({int? status, List<SmallUserData>? data});
}

/// @nodoc
class _$SmallUserModelCopyWithImpl<$Res, $Val extends SmallUserModel>
    implements $SmallUserModelCopyWith<$Res> {
  _$SmallUserModelCopyWithImpl(this._value, this._then);

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
              as List<SmallUserData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmallUserModelImplCopyWith<$Res>
    implements $SmallUserModelCopyWith<$Res> {
  factory _$$SmallUserModelImplCopyWith(_$SmallUserModelImpl value,
          $Res Function(_$SmallUserModelImpl) then) =
      __$$SmallUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, List<SmallUserData>? data});
}

/// @nodoc
class __$$SmallUserModelImplCopyWithImpl<$Res>
    extends _$SmallUserModelCopyWithImpl<$Res, _$SmallUserModelImpl>
    implements _$$SmallUserModelImplCopyWith<$Res> {
  __$$SmallUserModelImplCopyWithImpl(
      _$SmallUserModelImpl _value, $Res Function(_$SmallUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SmallUserModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SmallUserData>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SmallUserModelImpl implements _SmallUserModel {
  const _$SmallUserModelImpl({this.status, final List<SmallUserData>? data})
      : _data = data;

  factory _$SmallUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmallUserModelImplFromJson(json);

  @override
  final int? status;
  final List<SmallUserData>? _data;
  @override
  List<SmallUserData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SmallUserModel(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallUserModelImpl &&
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
  _$$SmallUserModelImplCopyWith<_$SmallUserModelImpl> get copyWith =>
      __$$SmallUserModelImplCopyWithImpl<_$SmallUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmallUserModelImplToJson(
      this,
    );
  }
}

abstract class _SmallUserModel implements SmallUserModel {
  const factory _SmallUserModel(
      {final int? status,
      final List<SmallUserData>? data}) = _$SmallUserModelImpl;

  factory _SmallUserModel.fromJson(Map<String, dynamic> json) =
      _$SmallUserModelImpl.fromJson;

  @override
  int? get status;
  @override
  List<SmallUserData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SmallUserModelImplCopyWith<_$SmallUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmallUserData _$SmallUserDataFromJson(Map<String, dynamic> json) {
  return _SmallUserData.fromJson(json);
}

/// @nodoc
mixin _$SmallUserData {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get employeeYear => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmallUserDataCopyWith<SmallUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmallUserDataCopyWith<$Res> {
  factory $SmallUserDataCopyWith(
          SmallUserData value, $Res Function(SmallUserData) then) =
      _$SmallUserDataCopyWithImpl<$Res, SmallUserData>;
  @useResult
  $Res call({int? id, String? name, String? employeeYear, String? role});
}

/// @nodoc
class _$SmallUserDataCopyWithImpl<$Res, $Val extends SmallUserData>
    implements $SmallUserDataCopyWith<$Res> {
  _$SmallUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? employeeYear = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeYear: freezed == employeeYear
          ? _value.employeeYear
          : employeeYear // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmallUserDataImplCopyWith<$Res>
    implements $SmallUserDataCopyWith<$Res> {
  factory _$$SmallUserDataImplCopyWith(
          _$SmallUserDataImpl value, $Res Function(_$SmallUserDataImpl) then) =
      __$$SmallUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? employeeYear, String? role});
}

/// @nodoc
class __$$SmallUserDataImplCopyWithImpl<$Res>
    extends _$SmallUserDataCopyWithImpl<$Res, _$SmallUserDataImpl>
    implements _$$SmallUserDataImplCopyWith<$Res> {
  __$$SmallUserDataImplCopyWithImpl(
      _$SmallUserDataImpl _value, $Res Function(_$SmallUserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? employeeYear = freezed,
    Object? role = freezed,
  }) {
    return _then(_$SmallUserDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeYear: freezed == employeeYear
          ? _value.employeeYear
          : employeeYear // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SmallUserDataImpl implements _SmallUserData {
  const _$SmallUserDataImpl({this.id, this.name, this.employeeYear, this.role});

  factory _$SmallUserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmallUserDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? employeeYear;
  @override
  final String? role;

  @override
  String toString() {
    return 'SmallUserData(id: $id, name: $name, employeeYear: $employeeYear, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmallUserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.employeeYear, employeeYear) ||
                other.employeeYear == employeeYear) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, employeeYear, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmallUserDataImplCopyWith<_$SmallUserDataImpl> get copyWith =>
      __$$SmallUserDataImplCopyWithImpl<_$SmallUserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmallUserDataImplToJson(
      this,
    );
  }
}

abstract class _SmallUserData implements SmallUserData {
  const factory _SmallUserData(
      {final int? id,
      final String? name,
      final String? employeeYear,
      final String? role}) = _$SmallUserDataImpl;

  factory _SmallUserData.fromJson(Map<String, dynamic> json) =
      _$SmallUserDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get employeeYear;
  @override
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$SmallUserDataImplCopyWith<_$SmallUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
