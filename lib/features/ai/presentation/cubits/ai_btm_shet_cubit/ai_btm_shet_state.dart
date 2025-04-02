part of 'ai_btm_shet_cubit.dart';

abstract class AiBtmShetState {}

class AiBtmShetInitial extends AiBtmShetState {}

class ToggleButton extends AiBtmShetState {}

class ShowAgainState extends AiBtmShetState {
  final bool showAgain;

  ShowAgainState(this.showAgain);
}
