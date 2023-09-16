import 'package:blocprac/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.counter == 3) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  'Current Counter: ${state.counter}',
                ),
              );
            },
          );
        } else if (state.counter == -2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'text',
                    ),
                  ),
                  body: const Center(
                    child: Text(
                      'text',
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${context.watch<CounterBloc>().state.counter}'),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(
                    IncrementCounterEvent(),
                  );
                },
                child: const Text(
                  '+',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(
                    DecrementCounterEvent(),
                  );
                },
                child: const Text(
                  '-',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
