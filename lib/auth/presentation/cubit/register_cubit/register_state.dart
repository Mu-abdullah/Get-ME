part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final CreateUserModel user;

  const RegisterSuccess(this.user);

  @override
  List<Object> get props => [user];
}
final class RegisterError extends RegisterState {
  final String error;

  const RegisterError(this.error);

  @override
  List<Object> get props => [error];
}


final class GetUserDataLoading extends RegisterState {}
final class GetUserDataSuccess extends RegisterState {
  final UserModel user;

  const GetUserDataSuccess(this.user);

  @override
  List<Object> get props => [user];
}
final class GetUserDataError extends RegisterState {
  final String error;

  const GetUserDataError(this.error);

  @override
  List<Object> get props => [error];
}