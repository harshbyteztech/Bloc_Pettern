import 'package:bloc_pettern/Bloc/ApiBloc/ApiBloc.dart';
import 'package:bloc_pettern/Bloc/ConnectivityBloc/ConnectivityBloc.dart';
import 'package:bloc_pettern/Bloc/CounterBloc/CounterBloc.dart';
import 'package:bloc_pettern/Bloc/ValidationBloc/ValidationBloc.dart';
import 'package:bloc_pettern/Screen/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/PostApiBloc/PostApiBloc.dart';
import 'Screen/PostApiScreen.dart';
import 'Screen/ValidationScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc(),),
        BlocProvider(create: (context) => ConnectivityBloc(),),
        BlocProvider(create: (context) => validationBloc(),),
        BlocProvider(create: (context) => ApiBloc(),),
        BlocProvider(create: (context) => PostApiBloc(),),
      ],
      child: MaterialApp(
        title: 'Bloc Pettern',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:PostApiScreen(),
      ),
    );
  }
}


