abstract class PostApiEvent{}


class PostApiLoadingEvent extends PostApiEvent{}

class PostApiButtonEvent extends PostApiEvent{
  Future<bool>? model;
  PostApiButtonEvent({this.model});}