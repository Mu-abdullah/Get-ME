part of 'policy_cubit.dart';

abstract class PolicyState {}

class PolicyInitial extends PolicyState {}

class PolicyLoaded extends PolicyState {
  final List<PolicyModel> policy;
  PolicyLoaded(this.policy);
}

class PolicyError extends PolicyState {
  final String message;
  PolicyError(this.message);
}

class PolicyLoading extends PolicyState {}
