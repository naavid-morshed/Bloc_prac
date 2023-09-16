import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../color_cubit/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementValue = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription colorSubscription;

  CounterCubit({required this.colorCubit}) : super(CounterState.init()) {
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.redAccent) {
        incrementValue = 1;
      } else if (colorState.color == Colors.greenAccent) {
        incrementValue = 10;
      } else if (colorState.color == Colors.blueGrey) {
        incrementValue = 100;
      } else if (colorState.color == Colors.yellowAccent) {
        incrementValue = 200;
        decrement();
      }
    });
  }

  void increment() {
    emit(
      state.copyWith(counter: state.counter + incrementValue),
    );
  }

  void decrement() {
    emit(
      state.copyWith(counter: state.counter - incrementValue),
    );
  }

  @override
  Future<void> close() async {
    await colorSubscription.cancel();
    super.close();
  }
}
