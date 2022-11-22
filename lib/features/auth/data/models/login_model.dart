// ignore_for_file: invalid_annotation_target

import 'package:fl_clean_arch/features/auth/domain/entities/login_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginModel extends LoginEntity {
  const LoginModel({
    required super.code,
    required super.message,
    DataLoginModel? super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataLoginModel extends DataLoginEntity {
  const DataLoginModel({
    required super.id,
    required super.name,
    required super.email,
    required super.token,
  });

  factory DataLoginModel.fromJson(Map<String, dynamic> json) =>
      _$DataLoginModelFromJson(json);
}
