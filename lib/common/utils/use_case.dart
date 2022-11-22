// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:fl_clean_arch/common/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithId<Type, Id, Params> {
  Future<Either<Failure, Type>> call(Id id, Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
