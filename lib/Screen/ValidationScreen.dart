import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationBloc.dart';
import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationEvent.dart';
import 'package:bloc_pettern/Screen/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/ValidationBloc/ValidationState.dart';
import 'ApiScreen.dart';

class ValidationScreen extends StatelessWidget {
  ValidationScreen({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  login(context)async{
    BlocProvider.of<validationBloc>(context)
        .add(validationButtonEvent(email: email.text,password: password.text));
   validationBloc().DataAdd(password: password.text,context: context,email: email.text);
    BlocProvider.of<validationBloc>(context)
        .add(validationFieldEvent(email: email.text,password: password.text));
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
              BlocBuilder<validationBloc, validationState>(
                builder: (context, state) {
                  if (state is validationErrorState) {
                    return Text('${state.ErrorMessage}',
                        style: TextStyle(color: Colors.red, fontSize: 20));
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: email,
                  onChanged: (value) {
                    BlocProvider.of<validationBloc>(context)
                        .add(validationFieldEvent(
                      email: email.text,
                      password: password.text,
                    ));
                  }),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                  controller: password,
                  onChanged: (value) {
                    BlocProvider.of<validationBloc>(context)
                        .add(validationFieldEvent(
                      email: email.text,
                      password: password.text,
                    ));
                  }),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<validationBloc, validationState>(
                  builder: (context, state) {
                return InkWell(
                  onTap: () {
                    state is validationValidState
                        ? login(context)
                        : print("Don't navigat you");
                  },
                  child: state is validationLoadingState? Center(child: CircularProgressIndicator()): Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: state is validationValidState
                            ? Colors.blueAccent
                            : Colors.grey),
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
