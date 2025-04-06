part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class UserFound extends AuthState {
  final UserModel user;
  const UserFound({required this.user});
}

final class UserNotFound extends AuthState {
  final String data;
  const UserNotFound({required this.data});
}

final class AuthError extends AuthState {
  final String error;

  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}
