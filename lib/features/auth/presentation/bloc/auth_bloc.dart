import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_clean_arch/features/auth/data/models/request/login_body.dart';
import 'package:fl_clean_arch/features/auth/domain/entities/login_entity.dart';
import 'package:fl_clean_arch/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.loginUsecase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final data = await loginUsecase.call(event.body);

      data.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthLoginSuccess(response: r)),
      );
    });
  }

  LoginUsecase loginUsecase;
}
