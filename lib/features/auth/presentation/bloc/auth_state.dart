part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess({
    required this.response,
  });
  final LoginEntity response;
}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  const AuthFailure({
    required this.message,
  });
  final String message;
}
