abstract class PostApiEvent{}


class PostApiLoadingEvent extends PostApiEvent{}

class PostApiButtonEvent extends PostApiEvent{
  String?Email;
  String?Password;
  PostApiButtonEvent({this.Email,this.Password});}