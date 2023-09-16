import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.init());

  void changeColor() {
    if (state.color == Colors.redAccent) {
      emit(state.copyWith(color: Colors.greenAccent));
    } else if (state.color == Colors.greenAccent) {
      emit(state.copyWith(color: Colors.blueGrey));
    } else if (state.color == Colors.blueGrey) {
      emit(state.copyWith(color: Colors.yellowAccent));
    } else if (state.color == Colors.yellowAccent) {
      emit(state.copyWith(color: Colors.redAccent));
    }
  }
}
