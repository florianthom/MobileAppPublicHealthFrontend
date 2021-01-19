import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';

import 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarState(NavbarRoute.Home.index));

  void setNewNavBarItem(int navBarItem) {
    emit(NavbarState(navBarItem));
  }
}