part of 'color_cubit.dart';

class ColorState extends Equatable{

  final Color color;

  const ColorState({required this.color});

  factory ColorState.init(){
    return const ColorState(color: Colors.redAccent);
  }

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'ColorInitial{color: $color}';
  }

  @override
  List<Object> get props => [color];
}
