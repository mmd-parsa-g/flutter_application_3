import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/themedata_bloc/themedata_event.dart';
import 'package:flutter_application_3/themedata_bloc/themedata_helper.dart';




class ThemeAppBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeAppBloc() : super(ThemeData.light()) {
    on<InitialThemeSetEvent>(_initialThemeSetEvent);
    on<ThemeSwitchEvent>(_themeSwitchEvent);
  }

  void _themeSwitchEvent(
    ThemeEvent event,
    Emitter<ThemeData> emit,
  ) {
    final isDark = state == ThemeData.dark();
    emit(isDark ? ThemeData.light() : ThemeData.dark());
    setTheme(isDark);
  }

  void _initialThemeSetEvent(
    ThemeEvent event,
    Emitter<ThemeData> emit,
  ) async {
    final bool hasDarkTheme = await isDark();
    if (hasDarkTheme) {
      emit(ThemeData.dark());
    } else {
      emit(ThemeData.light());
    }
  }
}
