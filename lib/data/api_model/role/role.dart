import 'package:freezed_annotation/freezed_annotation.dart';
part 'role.freezed.dart';
part 'role.g.dart';

@freezed
class Role with _$Role {
  const factory Role({
  String name
}) = _Role;

factory Role.fromJson(Map<String, dynamic> json) =>
_$Role(json);
}