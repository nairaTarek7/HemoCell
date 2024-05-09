abstract class NeedBloodStates {}

class NeedBloodInitialState extends NeedBloodStates {}

class DonateBloodInitialState extends NeedBloodStates {}

class DonateByEventLoadingState extends NeedBloodStates {}

class DonateByEventSuccessfullyState extends NeedBloodStates {}

class DonateByEventErrorState extends NeedBloodStates {
  final String error;
  DonateByEventErrorState(this.error);
}
