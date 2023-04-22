import 'package:bloc_pettern/Bloc/PostApiBloc/PostApiEvent.dart';
import 'package:bloc_pettern/Bloc/PostApiBloc/PostApiState.dart';
import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationEvent.dart';
import 'package:bloc_pettern/Services/ApiServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  PostApiBloc() : super(PostApiInitialState()) {
    on<PostApiButtonEvent>((event, emit) {
      // print("Event Status ===> ${event.model}");
      emit(PostApiLoadingState());
      try {
        Future<bool>? models =
            fetchAlbum(email: event.Email, password: event.Password);
        emit(PostApiLoadedState(models));
      } catch (e) {
        emit(PostApiErrorState(e.toString()));
      }
      // if(event.model != null){
      //   emit(PostApiLoadedState());
      // } else {
      //   emit(PostApiErrorState('Bad Reaspons'));
      // }
    });
    on<PostApiLoadingEvent>((event, emit) {
      emit(PostApiLoadingState());
    });
  }
}
