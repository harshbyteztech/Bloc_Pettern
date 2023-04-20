import 'package:firebase_auth/firebase_auth.dart';

abstract class validationEvent{}

class validationFieldEvent extends validationEvent{
  String?email;
  String?password;
  validationFieldEvent({this.email,this.password});
}

class validationButtonEvent extends validationEvent{
  String?email;
  String?password;
  FirebaseAuth auth = FirebaseAuth.instance;
  validationButtonEvent({this.email,this.password});


}
