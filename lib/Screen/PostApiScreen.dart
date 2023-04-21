import 'package:bloc_pettern/Bloc/ApiBloc/ApiBloc.dart';
import 'package:bloc_pettern/Bloc/ApiBloc/ApiBlocState.dart';
import 'package:bloc_pettern/Bloc/PostApiBloc/PostApiBloc.dart';
import 'package:bloc_pettern/Bloc/PostApiBloc/PostApiEvent.dart';
import 'package:bloc_pettern/Bloc/PostApiBloc/PostApiState.dart';
import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationBloc.dart';
import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationEvent.dart';
import 'package:bloc_pettern/Screen/HomeScreen.dart';
import 'package:bloc_pettern/Services/ApiServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/ValidationBloc/ValidationState.dart';
import 'ApiScreen.dart';

class PostApiScreen extends StatelessWidget {
  PostApiScreen({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  // bool  values = false;

  login(context)async{
    BlocProvider.of<PostApiBloc>(context)
        .add(PostApiButtonEvent(model: fetchAlbum(email: Email.text,password: Password.text)?.then((value) {
      print('value  =====> $value');
      value == true? BlocProvider.of<PostApiBloc>(context).add(PostApiLoadingEvent()):null;
          return  value;
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Validation Example'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: Email,),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                  controller: Password,
                 ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<PostApiBloc, PostApiState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                       login(context);
                      },
                      child: state is PostApiLoadedState? Center(child: CircularProgressIndicator()): Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey),
                        child: Center(
                          child: Text("Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                      ),
                    );
                  })
            ],
          )),
    );
  }
}
