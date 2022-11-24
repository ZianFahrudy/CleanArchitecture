import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fl_clean_arch/common/error/failure.dart';
import 'package:fl_clean_arch/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:fl_clean_arch/features/auth/data/models/request/login_body.dart';
import 'package:fl_clean_arch/features/auth/domain/entities/login_entity.dart';
import 'package:fl_clean_arch/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, LoginEntity>> login(LoginBody body) async {
    try {
      final remoteLogin = await remoteDataSource.login(body);

      if (remoteLogin.data != null) {
        return Right(remoteLogin);
      }

      return Left(ServerFailure(remoteLogin.message));
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response!.data}');
        log('${e.response!.headers}');
        return Left(
          ServerFailure.fromJson(e.response!.data as Map<String, dynamic>),
        );
      } else {
        // Something happened in setting up or sending the request
        //that triggered an Error
        log(e.message);
        return Left(ServerFailure(e.message));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
