import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkThemeState());

  bool get isDark => state is DarkThemeState;

  bool get isLight => state is LightThemeState;

  changeTheme() {
    if (state is DarkThemeState) {
      emit(LightThemeState());
    } else {
      emit(DarkThemeState());
    }
  }
}
