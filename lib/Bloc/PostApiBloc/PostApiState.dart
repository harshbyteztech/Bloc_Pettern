abstract class PostApiState{}

class PostApiInitialState extends PostApiState{}

class PostApiLoadingState extends PostApiState{}

class PostApiLoadedState extends PostApiState{}

class PostApiErrorState extends PostApiState{
  String? error;
  PostApiErrorState(this.error);
}
