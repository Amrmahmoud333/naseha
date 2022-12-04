import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'naseha_state.dart';

class NasehaCubit extends Cubit<NasehaState> {
  NasehaCubit() : super(NasehaInitial());
}
