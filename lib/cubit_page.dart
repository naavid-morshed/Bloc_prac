import 'package:blocprac/cubits/color_cubit/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/counter/counter_cubit.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          switch (state.counter) {
            case (3):
              showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      content: Text('Current Counter: ${state.counter}'),
                    );
                  });
            case (-2):
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(title: const Text('text')),
                  body: const Center(child: Text('text')),
                );
              }));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current increment value: ${context.read<CounterCubit>().incrementValue}',
                ),
                Text('${state.counter}'),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Text(
                    '+',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Text(
                    '-',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ColorCubit>().changeColor();
                  },
                  child: const Text(
                    'Change Color',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
