import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'color_state.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorInitial());
}
