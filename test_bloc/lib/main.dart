import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/counter_bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc()..add(const InitializeCounter()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(
                              const IncrementCounter(),
                            );
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(
                              const DecrementCounter(),
                            );
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.minimize),
                    ),
                  ],
                ),
              );
            } else {
              return const Text('Error!');
            }
          },
        ),
      ),
    );
  }
}
