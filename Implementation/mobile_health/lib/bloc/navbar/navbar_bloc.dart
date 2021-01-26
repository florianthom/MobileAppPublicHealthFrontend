import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_health/bloc/navbar/navbar_event.dart';
import 'package:mobile_health/models/navbar/navbarRoute.dart';
import 'navbar_state.dart';

///
/// Basic bloc of the application to track state-changes regarding the bottomNavigationBar
/// e.g. usefull to change the color of the bottomNavigationBarIcon according to the current route
///
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