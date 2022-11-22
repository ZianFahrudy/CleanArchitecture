import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class LoginEntity extends Equatable {
  const LoginEntity({
    required this.code,
    required this.message,
    this.data,
  });
  final int code;
  final String message;
  final DataLoginEntity? data;
  @override
  List<Object> get props => [code, message, data!];
}

class DataLoginEntity extends Equatable {
  const DataLoginEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });
  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'Token')
  final String token;

  @override
  List<Object> get props => [id, name, email, token];
}
