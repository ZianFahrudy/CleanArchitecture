import 'package:dartz/dartz.dart';
import 'package:fl_clean_arch/common/error/failure.dart';
import 'package:fl_clean_arch/common/utils/use_case.dart';
import 'package:fl_clean_arch/features/auth/data/models/login_body.dart';
import 'package:fl_clean_arch/features/auth/domain/entities/login_entity.dart';
import 'package:fl_clean_arch/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return _repository.login(params);
  }
}
