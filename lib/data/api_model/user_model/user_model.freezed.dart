// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get emailVerifiedAt => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get specialist => throw _privateConstructorUsedError;
  String? get employeeYear => throw _privateConstructorUsedError;
  String? get salary => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get activeStatus => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get darkMode => throw _privateConstructorUsedError;
  String? get messengerColor => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
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
      String? refreshToken});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? emailVerifiedAt = freezed,
    Object? profilePhoto = freezed,
    Object? dob = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? specialist = freezed,
    Object? employeeYear = freezed,
    Object? salary = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? activeStatus = freezed,
    Object? avatar = freezed,
    Object? darkMode = freezed,
    Object? messengerColor = freezed,
    Object? refreshToken = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      specialist: freezed == specialist
          ? _value.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeYear: freezed == employeeYear
          ? _value.employeeYear
          : employeeYear // ignore: cast_nullable_to_non_nullable
              as String?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      activeStatus: freezed == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      darkMode: freezed == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int?,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      String? refreshToken});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? emailVerifiedAt = freezed,
    Object? profilePhoto = freezed,
    Object? dob = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? specialist = freezed,
    Object? employeeYear = freezed,
    Object? salary = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? activeStatus = freezed,
    Object? avatar = freezed,
    Object? darkMode = freezed,
    Object? messengerColor = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      specialist: freezed == specialist
          ? _value.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeYear: freezed == employeeYear
          ? _value.employeeYear
          : employeeYear // ignore: cast_nullable_to_non_nullable
              as String?,
      salary: freezed == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      activeStatus: freezed == activeStatus
          ? _value.activeStatus
          : activeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      darkMode: freezed == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as int?,
      messengerColor: freezed == messengerColor
          ? _value.messengerColor
          : messengerColor // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.emailVerifiedAt,
      this.profilePhoto,
      this.dob,
      this.phoneNumber,
      this.gender,
      this.address,
      this.specialist,
      this.employeeYear,
      this.salary,
      this.createdAt,
      this.updatedAt,
      this.activeStatus,
      this.avatar,
      this.darkMode,
      this.messengerColor,
      this.refreshToken});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? emailVerifiedAt;
  @override
  final String? profilePhoto;
  @override
  final String? dob;
  @override
  final String? phoneNumber;
  @override
  final String? gender;
  @override
  final String? address;
  @override
  final String? specialist;
  @override
  final String? employeeYear;
  @override
  final String? salary;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? activeStatus;
  @override
  final String? avatar;
  @override
  final int? darkMode;
  @override
  final String? messengerColor;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, username: $username, emailVerifiedAt: $emailVerifiedAt, profilePhoto: $profilePhoto, dob: $dob, phoneNumber: $phoneNumber, gender: $gender, address: $address, specialist: $specialist, employeeYear: $employeeYear, salary: $salary, createdAt: $createdAt, updatedAt: $updatedAt, activeStatus: $activeStatus, avatar: $avatar, darkMode: $darkMode, messengerColor: $messengerColor, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.specialist, specialist) ||
                other.specialist == specialist) &&
            (identical(other.employeeYear, employeeYear) ||
                other.employeeYear == employeeYear) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.activeStatus, activeStatus) ||
                other.activeStatus == activeStatus) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.messengerColor, messengerColor) ||
                other.messengerColor == messengerColor) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        username,
        emailVerifiedAt,
        profilePhoto,
        dob,
        phoneNumber,
        gender,
        address,
        specialist,
        employeeYear,
        salary,
        createdAt,
        updatedAt,
        activeStatus,
        avatar,
        darkMode,
        messengerColor,
        refreshToken
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final int? id,
      final String? name,
      final String? email,
      final String? username,
      final String? emailVerifiedAt,
      final String? profilePhoto,
      final String? dob,
      final String? phoneNumber,
      final String? gender,
      final String? address,
      final String? specialist,
      final String? employeeYear,
      final String? salary,
      final String? createdAt,
      final String? updatedAt,
      final int? activeStatus,
      final String? avatar,
      final int? darkMode,
      final String? messengerColor,
      final String? refreshToken}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get username;
  @override
  String? get emailVerifiedAt;
  @override
  String? get profilePhoto;
  @override
  String? get dob;
  @override
  String? get phoneNumber;
  @override
  String? get gender;
  @override
  String? get address;
  @override
  String? get specialist;
  @override
  String? get employeeYear;
  @override
  String? get salary;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get activeStatus;
  @override
  String? get avatar;
  @override
  int? get darkMode;
  @override
  String? get messengerColor;
  @override
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
