import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ConnectivityState{Initial,Gaind,Lose}


class ConnectivityBloc extends Cubit<ConnectivityState>{
  Connectivity _connectivity =  Connectivity();
  StreamSubscription? conectivoitySubcription;

  ConnectivityBloc():super(ConnectivityState.Initial){
    conectivoitySubcription = _connectivity.onConnectivityChanged.listen((event) { 
       if(event == ConnectivityResult.mobile||event==ConnectivityResult.wifi){
         emit(ConnectivityState.Gaind);
       } else{
         emit(ConnectivityState.Lose);
       }
    });
  }
  Future<void> close(){
    conectivoitySubcription?.cancel();
    return super.close();
  }
}