abstract class NavbarEvent {}

///*
class SetNewNavBarRoute extends NavbarEvent {
  final int newNavBarRoute;

  SetNewNavBarRoute(this.newNavBarRoute);
}
