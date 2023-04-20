

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int>{
  CounterBloc() : super(0);

  void Increament(){
    emit(state + 1);
  }
  void Decreament(){
    emit(state - 1);
  }

}