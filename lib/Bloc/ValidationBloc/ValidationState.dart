abstract class validationState{}

class validationInitialState extends validationState{}

class validationLoadingState extends validationState{}

class validationLogInState extends validationState{}

class validationValidState extends validationState{}

class validationErrorState extends validationState{
  String? ErrorMessage;
  validationErrorState({this.ErrorMessage});
}