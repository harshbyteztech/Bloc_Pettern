
import 'package:bloc_pettern/Bloc/ApiBloc/ApiBloc.dart';
import 'package:bloc_pettern/Bloc/ApiBloc/ApiBlocState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Api Data Get Example'),
        centerTitle: true,
      ),
      body: BlocBuilder<ApiBloc,ApiState>(builder: (context, state) {
        if(state is ApiLoadingState){
          return  Center(child: CircularProgressIndicator(),);
        } else if(state is ApiLoadedState){
          return ListView.builder(
              itemCount: state.Models?.length,
              itemBuilder: (context, index) {
                var data = state.Models?[index];
                return ListTile(
                    title: Text("${data?.title}"),
                    subtitle: Text('${data?.body}'));
              });
        }
        return Center(child: Text('An error occured!'),);
      },),
    );
  }
}
