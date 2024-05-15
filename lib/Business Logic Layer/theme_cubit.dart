import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_project/Helper/enum.dart';

class ThemeCubit extends Cubit<ThemeModeEnum> {
  ThemeCubit() : super(ThemeModeEnum.light);

  void setTheme(ThemeModeEnum mode) {
    emit(mode);
  }
}
