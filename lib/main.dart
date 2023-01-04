import 'package:belajar_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterBloc bloc = CounterBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Bloc'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                stream: bloc.stateStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                  );
                },
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bloc.eventSink.add(CounterDecrementEvent());
                    },
                    child: const Text('Decrement'),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bloc.eventSink.add(CounterIncrementEvent());
                    },
                    child: const Text('Increment'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
