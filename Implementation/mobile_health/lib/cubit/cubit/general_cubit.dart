import 'package:mobile_health/cubit/state/general_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitial());

  void selectSelectedNavBarItem(int navBarItem) {
    emit(GeneralSetCurrentNavState(navBarItem));
  }
}

