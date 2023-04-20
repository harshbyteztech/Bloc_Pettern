import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/ConnectivityBloc/ConnectivityBloc.dart';
import '../Bloc/CounterBloc/CounterBloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Counter & Connectivity Example'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<ConnectivityBloc, ConnectivityState>(
            builder: (context, state) {
              if (state == ConnectivityState.Gaind) {
                return const Center(
                  child: Text('Connected',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                );
              } else if (state == ConnectivityState.Lose) {
                return const Center(
                  child: Text('Not connected',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                );
              } else {
                return const Center(
                  child: Text('Loading....',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                );
              }
            },
            listener: (context, state) {
              if (state == ConnectivityState.Gaind) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet connected'),
                  backgroundColor: Colors.green,
                ));
              } else if (state == ConnectivityState.Lose) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Internet Not  connected'),
                  backgroundColor: Colors.red,
                ));
              }
            },
          ),

          BlocBuilder<CounterBloc,int>(
            builder: (context, state) {
              return Center(
                  child: Text(
                    state.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ));
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).Increament();
            },
            child: Center(child: Icon(Icons.add)),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).Decreament();
            },
            child: Center(child: Icon(Icons.remove)),
          ),
        ],
      ),
    );
  }
}
