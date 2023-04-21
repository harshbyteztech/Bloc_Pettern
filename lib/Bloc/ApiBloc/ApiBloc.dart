import 'package:bloc_pettern/Bloc/ApiBloc/ApiBlocState.dart';
import 'package:bloc_pettern/Services/ApiServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/UserDataModel.dart';
import '../ValidationBloc/ValidationEvent.dart';


TextEditingController Email = TextEditingController();
TextEditingController Password = TextEditingController();

class ApiBloc extends Cubit<ApiState> {
  ApiBloc() : super(ApiLoadingState()){
    fetchData();
  }

  void fetchData() async {
    try {
      Future<bool>? model;
      emit(ApiLoadedState(Models: model));
    } catch(ex){
      emit(ApiErrorState(ErrorMessage: ex.toString()));
    }
  }


}