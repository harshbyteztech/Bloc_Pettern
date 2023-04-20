import 'package:bloc_pettern/Bloc/ApiBloc/ApiBlocState.dart';
import 'package:bloc_pettern/Services/ApiServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/UserDataModel.dart';

class ApiBloc extends Cubit<ApiState> {
  ApiBloc() : super(ApiLoadingState()){
    fetchData();
  }

  void fetchData() async {
    try {
      List<Model>? model = await fetchAlbum();
      emit(ApiLoadedState(Models: model));
    } catch(ex){
      emit(ApiErrorState(ErrorMessage: ex.toString()));
    }
  }
}