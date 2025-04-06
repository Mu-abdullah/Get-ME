part of 'account_cubit.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {}

final class GetUserLoading extends AccountState {}

final class GetUserSuccess extends AccountState {
  final UserModel userModel;
  const GetUserSuccess(this.userModel);
  @override
  List<Object> get props => [userModel];
}

final class GetUserError extends AccountState {
  final String message;
  const GetUserError(this.message);
  @override
  List<Object> get props => [message];
}