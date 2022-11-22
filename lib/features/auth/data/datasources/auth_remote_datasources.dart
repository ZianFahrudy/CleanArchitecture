// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';
import 'package:fl_clean_arch/common/error/exceptions.dart';
import 'package:fl_clean_arch/features/auth/data/models/login_body.dart';
import 'package:fl_clean_arch/features/auth/data/models/login_model.dart';
import 'package:fl_clean_arch/features/auth/domain/entities/login_entity.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> login(LoginBody body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<LoginEntity> login(LoginBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        '/api/authaccount/login',
        data: body.toJson(),
      );

      return LoginModel.fromJson(_response.data!);
    } on DioError catch (e) {
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
