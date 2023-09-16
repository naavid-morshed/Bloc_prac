part of 'counter_cubit.dart';

class CounterState extends Equatable{
  final int counter;

  factory CounterState.init(){
    return const CounterState(counter: 0);
  }

  const CounterState({
    required this.counter,
  });

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() {
    return 'CounterState{counter: $counter}';
  }

  @override
  List<Object> get props => [counter];
}
