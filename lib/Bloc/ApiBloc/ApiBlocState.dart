import '../../Models/UserDataModel.dart';

abstract class ApiState{}

class ApiLoadingState extends ApiState{}

class ApiLoadedState extends ApiState{
  Future<bool>? Models;
   ApiLoadedState({this.Models});
}

class ApiErrorState extends ApiState{
  String?ErrorMessage;
  ApiErrorState({this.ErrorMessage});
}