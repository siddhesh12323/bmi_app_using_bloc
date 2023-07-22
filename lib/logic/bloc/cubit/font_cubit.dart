import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'font_state.dart';

class FontCubit extends Cubit<FontState> {
  FontCubit() : super(FontInitial());
}
