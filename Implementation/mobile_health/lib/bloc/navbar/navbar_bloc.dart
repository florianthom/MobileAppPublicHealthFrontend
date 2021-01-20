import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_event.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';
import 'navbar_state.dart';

///*
class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  // : super(NavbarState(init_value))
  NavbarBloc() : super(NavbarState(NavbarRoute.Home.index));

  // void setNewNavBarItem(int navBarItem) {
  //   emit(NavbarState(navBarItem));
  // }

  @override
  Stream<NavbarState> mapEventToState(NavbarEvent event) async* {
    if(event is SetNewNavBarRoute)
      {
        yield NavbarState(event.newNavBarRoute);
      }
  }
}