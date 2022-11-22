import 'package:dio/dio.dart';
import 'package:fl_clean_arch/core/env/env_config.dart';
import 'package:fl_clean_arch/core/network/dio_handler.dart';
import 'package:fl_clean_arch/core/prefs/shared_prefs.dart';
import 'package:fl_clean_arch/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:fl_clean_arch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fl_clean_arch/features/auth/domain/repositories/auth_repository.dart';
import 'package:fl_clean_arch/features/auth/domain/usecases/login_usecase.dart';
import 'package:fl_clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> init() async {
    final config = EnvConfig.getInstance();
    final prefs = await SharedPrefs.getInstance();

    sl
      ..registerLazySingleton(() => prefs)
      ..registerLazySingleton(() => config)
      ..registerLazySingleton<Dio>(() => sl<DioHandler>().dio)
      ..registerLazySingleton(() => DioHandler(config: sl(), preferences: sl()))
      ..registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl()),
      )
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl()),
      )
      ..registerLazySingleton(() => AuthBloc(sl()))
      ..registerLazySingleton(() => LoginUsecase(sl()));
  }
}
