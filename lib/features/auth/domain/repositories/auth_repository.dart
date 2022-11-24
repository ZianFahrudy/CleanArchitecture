// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

import 'package:fl_clean_arch/common/error/failure.dart';
import 'package:fl_clean_arch/features/auth/data/models/request/login_body.dart';
import 'package:fl_clean_arch/features/auth/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> login(
    LoginBody body,
  );
}
