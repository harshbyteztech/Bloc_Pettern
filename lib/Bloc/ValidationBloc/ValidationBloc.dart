import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationEvent.dart';
import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationState.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Screen/ApiScreen.dart';

class validationBloc extends Bloc<validationEvent,validationState>{
  validationBloc() : super(validationInitialState()){
    on<validationFieldEvent>((event, emit) {
      if(event.email!.length <10){
        emit(validationErrorState(ErrorMessage: 'Please Enter Valid Number'));
      } else if(event.password!.length < 5){
        emit(validationErrorState(ErrorMessage: 'Please Enter Valid Password'));
      }
      else{
        emit(validationValidState());
      }
    });
    on<validationButtonEvent>((event, emit) {
      emit(validationLoadingState());
    });
  }
 DataAdd({String?email,String?password,context}){
   FirebaseAuth auth = FirebaseAuth.instance;
   auth.createUserWithEmailAndPassword(email: email.toString(), password: password.toString());
   Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => ApiScreen(),
       ));
 }
}